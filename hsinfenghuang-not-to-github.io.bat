cd "C:\Users\chbon\Downloads\hsinfenghuang-not-to-github.io-main"
git init
git add .
git commit -m "20251205 v1"
git remote add origin https://github.com/hsinfenghuang/hsinfenghuang-not-to-github.io.git
git checkout -b main
git pull origin main --rebase
git rebase --continue
git status
pause
git push -u origin main
pause
