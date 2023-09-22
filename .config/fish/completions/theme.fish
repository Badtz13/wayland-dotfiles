function __theme_dirs
    for dir in /home/badtz/Pictures/wallpapers/*/
        set dir_name (basename $dir)
        if [ "$dir_name" != "To Sort" ]
            echo $dir_name
        end
    end
end
