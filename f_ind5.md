ind5 () {
        books_directory="/mnt/c/Users/Owner/Downloads"
        index_file="$HOME/books_index.txt"
        if [ ! -d "$books_directory" ]
        then
                echo "Books directory not found: $books_directory"
                return 1
        fi
        touch "$index_file"
        filter=""
        if [ "$1" = "s" ] || [ "$1" = "-s" ] || [ "$1" = "search" ] || [ "$1" = "g" ] || [ "$1" = "-g" ] || [ "$1" = "grep" ]
        then
                filter="$2"
                shift 2
        fi
        display_menu () {
                echo "Books Index:"
                index=0
                while IFS= read -r -d '' file
                do
                        index=$((index+1))
                        if [ -z "$filter" ] || echo "$file" | grep -i "$filter" > /dev/null
                        then
                                echo "[$index] $(basename "$file")"
                        fi
                done < <(find "$books_directory" -type f \( -iname "*.pdf" -o -iname "*.pub" \) -print0)
        }
        open_book () {
                selected_index=$1
                index=0
                while IFS= read -r -d '' file
                do
                        index=$((index+1))
                        if [ "$index" -eq "$selected_index" ]
                        then
                                win_path=$(echo "$file" | sed 's|^/mnt/\(.\)/|\1:/|')
                                web_search openb local "$win_path"
                                return
                        fi
                done < <(find "$books_directory" -type f \( -iname "*.pdf" -o -iname "*.pub" \) -print0)
                echo "Invalid index. Please enter a valid number."
        }
        edit_nickname () {
                selected_index=$1
                file=$(find "$books_directory" -type f \( -iname "*.pdf" -o -iname "*.pub" \) -print0 | sed -n "${selected_index}p" -z)
                echo -n "Enter nickname for $(basename "$file"): "
                read -r nickname
                echo "$selected_index,$file,$nickname" >> "$index_file"
        }
        while true
        do
                display_menu > /dev/null
                if [ $index -eq 0 ]
                then
                        echo "No books were found. Try again?"
                        read -r new_filter
                        filter="$new_filter"
                        continue
                fi
                display_menu
                echo -n "Enterodasr the index to open (e.g., 1), 'q' to quit, or 'e' to edit a nickname: "
                read -r input
                case "$input" in
                        ([0-9]*) if [ "$input" -le $index ] && [ "$input" -gt 0 ]
                                then
                                        open_book "$input"
                                        return 0
                                else
                                        echo "Invalid index. Please enter a valid number."
                                fi ;;
                        (e[0-9]*) edit_nickname "${input:1}" ;;
                        (q) echo "Exiting..."
                                return 0 ;;
                        (*) echo "Invalid input. Please enter a valid number, 'q' to quit, or 'e' to edit a nickname." ;;
                esac
        done
        
}