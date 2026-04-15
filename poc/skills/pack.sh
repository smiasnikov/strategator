#!/bin/bash
# Упаковать скиллы Стратегатора в ZIP для загрузки в claude.ai Settings → Capabilities

SKILLS_DIR="$(cd "$(dirname "$0")" && pwd)"
OUT_DIR="$SKILLS_DIR/zips"

mkdir -p "$OUT_DIR"

for skill_dir in "$SKILLS_DIR"/strategator "$SKILLS_DIR"/strategator-strategize "$SKILLS_DIR"/strategator-plan; do
  skill_name=$(basename "$skill_dir")
  zip_path="$OUT_DIR/$skill_name.zip"
  (cd "$skill_dir" && zip -r "$zip_path" SKILL.md)
  echo "Упакован: $zip_path"
done

echo ""
echo "Готово. Загрузи эти 3 файла в claude.ai → Settings → Capabilities → Add skill:"
ls "$OUT_DIR"/*.zip
