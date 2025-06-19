#!/usr/bin/env bash

# starting palette
colors=(red orange yellow green blue magenta)

# adjust starting palette
lightness_offset=0.05
hue_offset=340
desaturation=0.05

# generate base from colors
base_lighten=0.15
base_desat=0.1

# generate bright from colors
bright_sat=0.1
bright_lighten=0.1

# generate black
base_color="black"
dark_gray=$(pastel lighten 0.2 "$base_color")
darker_gray=$(pastel lighten 0.1 "$base_color")

echo -n " $(pastel format hex "$dark_gray") "
pastel paint -n "$dark_gray" "████████"
pastel paint -n "$darker_gray" "████████"
echo " $(pastel format hex "$darker_gray")"

# generate palette
for color in "${colors[@]}"; do
    color=$(pastel rotate "$hue_offset" "$color")
    color=$(pastel lighten "$lightness_offset" "$color")
    color=$(pastel desaturate "$desaturation" "$color")

    base_variant=$(pastel lighten "$base_lighten" "$color" | pastel desaturate "$base_desat")
    bright_variant=$(pastel saturate "$bright_sat" "$color" | pastel lighten "$bright_lighten")

    base_hex=$(pastel format hex "$base_variant")
    bright_hex=$(pastel format hex "$bright_variant")

    echo -n " $base_hex "
    pastel paint -n "$base_variant" "████████"
    pastel paint -n "$bright_variant" "████████"
    echo " $bright_hex"
done

# generate white
base_color="white"
light_gray=$(pastel darken 0.2 "$base_color")
lighter_gray=$(pastel darken 0.1 "$base_color")

echo -n " $(pastel format hex "$lighter_gray") "
pastel paint -n "$lighter_gray" "████████"
pastel paint -n "$light_gray" "████████"
echo " $(pastel format hex "$light_gray")"
