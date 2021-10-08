set -e

cur_dir=$(pwd)
tmp_dir=$(mktemp -d)
out_dir="out/"
swaggerfile="../swagger.yml"

rm -rf $out_dir
mkdir -p $out_dir

cd $tmp_dir
mkdir -p test

wget https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.27/swagger-codegen-cli-3.0.27.jar -O swagger-codegen-cli.jar


cd $cur_dir

java -jar $tmp_dir/swagger-codegen-cli.jar generate --help
_JAVA_OPTIONS="--add-opens=java.base/java.util=ALL-UNNAMED" java \
    -jar $tmp_dir/swagger-codegen-cli.jar \
    generate \
    -l python \
    -i ${swaggerfile} \
    -DpackageName=leetcode \
    --git-user-id=prius \
    --git-repo-id=python-leetcode \
    -o ${out_dir}

rm -rf $tmp_dir

mv ${out_dir}/README.md ${out_dir}/README.generated.md
mv ${out_dir}/setup.py ${out_dir}/setup.generated.py
mv ${out_dir}/.travis.yml ${out_dir}/.travis.generated.yml

patch -d ${out_dir} -p1 < fix_cookies.patch
patch -d ${out_dir} -p1 < fix_thread_pool.patch
patch -d ${out_dir} -p1 < fix_gitignore.patch
