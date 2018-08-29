#	first record a screencast with demos/record.sh

export GIFSICLE_OPTS = --colors 256 --resize-method mix --resize-colors 256 --optimize=3

%.gif: %.cast
	asciicast2gif -t solarized-dark "$<" "$@"

%.mp4: %.gif
	rm -f "$@"
	ffmpeg -i "$<" \
		-c:v libx265 -r 60 -an -preset slower -crf 25 \
		-tag:v hvc1 \
		-movflags faststart \
		-pix_fmt yuv420p \
		-vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" \
		"$@"
