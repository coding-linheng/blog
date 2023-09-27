#!/bin/bash


origin_dir=$(dirname $(realpath $0) )

cd "$origin_dir" ||  exit


# 返回上级
cd ..
cd ..
cd ..

# 获取当前目录
base_dir=$(pwd)
# 定义文件夹路径
folder="$base_dir/public/theme/brooklyn-playful/fonts"

# 定义输出文件路径
output_file="$origin_dir/test.text"

if [ -d "$base_dir/public" ]; then
# 初始化 JSON 格式字符串
json="{"
# 遍历文件夹下的文件
for file in "$folder"/*; do
#    echo "$file"
    # 检查文件是否为普通文件
    if [[ -f "$file" ]]; then
        # 获取文件名和后缀
        filename=$(basename "$file")
        prefix=${filename%%.*}

        # 替换连字符为空格
        prefix=$(echo "$prefix" | sed 's/-/ /g')

        # 将前缀作为键，文件名加后缀作为值添加到 JSON 格式字符串中
        json+="\"$prefix\":\"$filename\","
    fi
done
# 移除最后一个多余的逗号
json="${json%,}"

# 完成 JSON 格式字符串
json+="}"

# 将 JSON 格式字符串写入到输出文件中
#echo "$json" > "$output_file"
echo "$json"
#echo "$json" > $output_file
else
    echo "Path error: ${base_dir}"
    exit 1
fi

