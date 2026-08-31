# Markdown tools for Kakoune
#
# Commands:
#   md-open-link          Open the Markdown link under the cursor
#   md-toggle-checkbox    Toggle a Markdown checkbox on/off
#
# Supported link syntax:
#   [text](destination)
#   [text][reference]
#   [reference]: destination


# ─────────────────────────────────────────────────────────────────────────────
# State
# ─────────────────────────────────────────────────────────────────────────────

declare-option -hidden str md_link_path
declare-option -hidden str md_link_refid


# ─────────────────────────────────────────────────────────────────────────────
# Find the Markdown link destination
# ─────────────────────────────────────────────────────────────────────────────

define-command -hidden md-grab-link \
    -docstring "get the destination of the Markdown link under the cursor" %{

    try %{
        execute-keys -draft '<a-i>['
    } catch %{
        fail "not a Markdown link"
    }

    evaluate-commands -draft %{
        execute-keys '<a-a>[' 'l'

        try %{
            execute-keys '<a-i>('
            set-option buffer md_link_path %val{selection}
        } catch %{
            try %{
                execute-keys '<a-i>['
                set-option buffer md_link_refid %val{selection}
            } catch %{
                fail "not a Markdown link"
            }
        }
    }

    evaluate-commands -draft %sh{
        [ -n "$kak_opt_md_link_refid" ] || exit 0

        escaped=$(printf '%s' "$kak_opt_md_link_refid" |
            sed -e 's/[.[\*^$()+?|\\]/\\&/g' -e 's/{/\\{/g' -e 's/}/\\}/g')

        printf "execute-keys '/^[[:space:]]*\\\\[%s\\\\]:[[:space:]]*<ret>lGl'\n" \
            "$escaped"
        printf '%s\n' 'set-option buffer md_link_path %val{selection}'
    }
}


# ─────────────────────────────────────────────────────────────────────────────
# Open Markdown link
# ─────────────────────────────────────────────────────────────────────────────

define-command md-open-link \
    -docstring "open the Markdown link under the cursor" %{

    md-grab-link

    evaluate-commands %sh{
        path="$kak_opt_md_link_path"

        if [ -z "$path" ]; then
            printf '%s\n' 'fail "empty Markdown link destination"'
            exit 0
        fi

        # Strip angle brackets: <my file.md> -> my file.md
        case "$path" in
            '<'*'>')
                path="${path#<}"
                path="${path%>}"
                ;;
        esac

        # Open URLs externally.
        case "$path" in
            http://*|https://*|mailto:*)
                nohup xdg-open "$path" >/dev/null 2>&1 &
                printf '%s\n' \
                    'echo -markup {green}opened link'
                exit 0
                ;;
        esac

        # Reject document-local anchors.
        case "$path" in
            '#'*)
                printf '%s\n' \
                    'fail "document-local anchors are not supported"'
                exit 0
                ;;
        esac

        # Strip Markdown link title: file.md "title" -> file.md
        case "$path" in
            *' "'*'"')
                path="${path%% \"*}"
                ;;
            *" '"*"'")
                path="${path%% \'*}"
                ;;
        esac

        # Resolve relative paths against the buffer's directory.
        case "$path" in
            /*) ;;
            *)
                path="$(dirname "$kak_buffile")/$path"
                ;;
        esac

        # Normalize ../ and ./ components.
        if command -v readlink >/dev/null 2>&1; then
            normalized=$(readlink -f "$path" 2>/dev/null)
            if [ -n "$normalized" ]; then
                path="$normalized"
            fi
        fi

        # Existing file.
        if [ -f "$path" ]; then

            case "$path" in
                *.md|*.markdown)
                    escaped=$(printf '%s' "$path" |
                        sed "s/'/''/g")

                    printf '%s\n' "edit '$escaped'"
                    ;;

                *)
                    mime=$(xdg-mime query filetype "$path" 2>/dev/null)
                    desktop=$(xdg-mime query default "$mime" 2>/dev/null)

                    escaped=$(printf '%s' "$path" |
                        sed "s/'/''/g")

                    if [ "$desktop" = "kak.desktop" ]; then
                        printf '%s\n' "edit '$escaped'"
                    else
                        nohup xdg-open "$path" >/dev/null 2>&1 &
                        printf '%s\n' \
                            'echo -markup {green}opened file'
                    fi
                    ;;
            esac

            exit 0
        fi

        # Missing Markdown files are created automatically.
        case "$path" in
            *.md|*.markdown)
                mkdir -p "$(dirname "$path")"

                escaped=$(printf '%s' "$path" |
                    sed "s/'/''/g")

                printf '%s\n' \
                    "edit '$escaped'" \
                    'echo -markup {green}created new Markdown file'
                ;;

            *)
                printf '%s\n' \
                    'fail "link does not exist and is not a Markdown file"'
                ;;
        esac
    }
}


# ─────────────────────────────────────────────────────────────────────────────
# Checkbox
# ─────────────────────────────────────────────────────────────────────────────

define-command md-toggle-checkbox \
    -docstring "toggle a Markdown checkbox on or off" %{

    try %{
        execute-keys 'xs^\h*-\h+\[[ xX]\]<ret><a-i>['
    } catch %{
        fail "no checkbox on this line"
    }

    evaluate-commands %sh{
        if [ "$kak_selection" = " " ]; then
            printf '%s\n' 'execute-keys rx'
        else
            printf '%s\n' "execute-keys 'r<space>'"
        fi
    }
}


# ─────────────────────────────────────────────────────────────────────────────
# Markdown mappings
# ─────────────────────────────────────────────────────────────────────────────

hook global BufSetOption filetype=markdown %{
    map buffer normal <ret> ': md-open-link<ret>'
    map buffer user x ': md-toggle-checkbox<ret>'
}
