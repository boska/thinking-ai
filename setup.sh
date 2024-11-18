#!/bin/bash

# 建立主要目錄結構
mkdir -p styles assets/images assets/code chapters appendix

# 建立章節目錄
for i in {01..08}; do
  case $i in
    "01") chapter="what-is-ai" ;;
    "02") chapter="ml-basics" ;;
    "03") chapter="neural-networks" ;;
    "04") chapter="cnn" ;;
    "05") chapter="rnn" ;;
    "06") chapter="image-recognition" ;;
    "07") chapter="nlp-project" ;;
    "08") chapter="rl-project" ;;
  esac
  mkdir -p "chapters/$i-$chapter"
  touch "chapters/$i-$chapter/README.md"
done

# 建立子章節檔案
mkdir -p chapters/01-what-is-ai
touch chapters/01-what-is-ai/{history,types,applications}.md

mkdir -p chapters/02-ml-basics
touch chapters/02-ml-basics/{supervised,unsupervised,reinforcement}.md

mkdir -p chapters/03-neural-networks
touch chapters/03-neural-networks/basics.md

mkdir -p chapters/04-cnn
touch chapters/04-cnn/architecture.md

mkdir -p chapters/05-rnn
touch chapters/05-rnn/lstm.md

for i in {06..08}; do
  case $i in
    "06") chapter="image-recognition" ;;
    "07") chapter="nlp-project" ;;
    "08") chapter="rl-project" ;;
  esac
  touch "chapters/$i-$chapter/project.md"
done

# 建立附錄檔案
touch appendix/{tools,further-reading}.md

# 建立主要檔案
touch README.md SUMMARY.md

# 建立樣式檔案
touch styles/website.css

# 建立並寫入 book.json
cat > book.json << 'EOF'
{
  "title": "AI 程式設計：thinking in AI",
  "author": "Your Name",
  "language": "zh-tw",
  "plugins": [
    "highlight",
    "github",
    "code",
    "katex",
    "-sharing",
    "copy-code-button"
  ],
  "pluginsConfig": {
    "github": {
      "url": "https://github.com/your-repo"
    }
  },
  "styles": {
    "website": "styles/website.css"
  }
}
EOF

# 建立並寫入基本的 CSS
cat > styles/website.css << 'EOF'
.markdown-section pre {
  background-color: #f6f8fa;
  border-radius: 3px;
  padding: 16px;
}

.markdown-section code {
  background-color: rgba(27,31,35,.05);
  border-radius: 3px;
  padding: 0.2em 0.4em;
}

.page-inner {
  max-width: 900px !important;
}
EOF

echo "GitBook 專案結構已建立完成！"