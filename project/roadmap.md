# nanana

A crowdsourcing app to bring out African lyrics transcriptions and translations.

db content can be search on the web
contributions must be done through the app (android,iOS,mac,windows)

## user space

User (
	email,
	password,
	name,
	avatar,
	dateCreate,
	dateUpdate,
	transcriptions,
	translations,
	evaluations,
	comments
)
- user can access their contributions from user view
- user can access latest contributions from home view
- user can search for a song by artist, song, album, source language, is translation available
- if song is found in db
	- user can rank others contributions (i.e. à la stackoverflow) // phase2
	- user can comment // phase2
- if no match in db suggest to create a first transcription

## transcribe

Transcription (
	required id,
	required artist,
	album = '',
	required song,
	required youtubeUrl,
	required language,
	required userId,
	required dateCreate,
	dateUpdate?,
	lyrics = ''
)

- user can play youtube video
- user can run a speech to text function to prepare lyrics
- user can write lyrics in a custom text editor
- user can save/update/delete the transcription
- user can share the transcription url

_once song is saved user can translate it_

## translate

Translation (
	required id,
	required transcriptionId,
	required userId,
	required sourceLanguage,
	required targetLanguage,
	required dateCreate,
	dateUpdate?,
	text = ''
)

- user can run a AI/MT function to prepare translation
- user can write lyrics (line per line line below the transcription for mobile/responsive design)
- user can save/update/delete the translation
- user can share the transcription url


## tech issues
- user authent (firebase for quick/free set-up ?)
- language list is constraining on purpose
	- it will prevent users from creating transcriptions from languages __WE__ are not interested in
- languages list for AI speech2text and for AI translation must be filtered to match this list
- AI languages lists will probably not match this list, it would be better to grey-out the option


// 2024_05_20 
- le site web sera propulsé aussi par top shelf en html