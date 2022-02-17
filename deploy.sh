#!/bin/bash
COURSEID=124111
jekyll b
git add assets/images/* && git commit -m "updated images" && git push
rm -r inlines
mkdir inlines
OLDIFS=$IFS
IFS=','
for paget in staff,staff-information home,welcome; do
    set -- $paget
    echo $1.html
    npm exec juice _site/$1.html inlines/$1.html
    sed -i '' 's?/assets?https://github.com/shaananc/foa-website/raw/main/assets?g' inlines/$1.html
    curl -X PUT -H "Authorization: Bearer $(cat .canvastoken)" https://canvas.lms.unimelb.edu.au/api/v1/courses/$COURSEID/pages/$2 --data-urlencode "wiki_page[body]=$(cat inlines/$1.html)"
done
IFS=$OLDIFS
echo '\n'
