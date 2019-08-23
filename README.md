# Zip Audio - Play arbitrary audio files from within a compressed folder

This script is designed for language audio retrieval, but should work equally well for other purposes.

If you are working with language documentation or language learning, you may have folders filled with many thousands of small audio clips, each representing a word or phrase in the given language. These folders can become quite unwieldy and impractical to use over time, at which point it may be easier to compress and store them as zip files.

This script allows you to specify a compressed folder of audio files and play arbitrary files from within that folder on the command-line. This allows for a relatively compact and convenient way of storing and accessing large corpora of frequently-used language audio.

The tool assumes that the compressed file has the following structure:

    foldername.zip
      foldername/word1.mp3
      foldername/word2.mp3
      foldername/word3.mp3
      etc...

... where `word1`, `word2` etc are named after the words in the corresponding audio file.

## Requirements

Apart from [Ruby](https://www.ruby-lang.org/), the script uses [mplayer](https://mplayerhq.hu/) to play the audio.

## Usage

    ./play_zipped_audio [FILE.zip] [KEYWORD]

For example, if you had a zipped folder containing two audio clips with the pronunciation of the words "foo" and "bar", the structure of the file might look something like this:

    foobar.zip
      bar.mp3
      foo.mp3

You could then play the audio for `foo.mp3` without needing to extract it from the folder using the following command:

    ./play_zipped_audio foobar.zip foo

Similarly, you could play `bar.mp3` using:

    ./play_zipped_audio foobar.zip bar

If your compressed file contains, say, 15,000 audio clips, this can make for a convenient way of effectively querying an "audio dictionary" for pronunciations without the hassle of compressing and decompressing the files.

It is also possible to specify a command such as the one above in a dictionary application like [Goldendict](http://goldendict.org/) so that it automatically looks up pronunciations for playback within the app.

## To do

* Option to specify different audio file extensions / filetype
* Config file to specify default file to search for specific languages with option `-d` / `--dict` or `-l` / `--lang`
* Option to list all files in archive
* Option to list file sizes in archive
* Option to look up multiple keywords at once
* Handle `.tar.gz` and other compressed file formats apart from `.zip`
* Option to use alternate playback command than `mplayer`, or perhaps pipe to external program

## License

MIT.
