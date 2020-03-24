"-*- mode: smalltalk; -*-"
Metacello new baseline: #Clap;
  repository: 'gitlocal://.';
  onLock: [:ex :old :new | ex honor];
  ignoreImage; load: 'development-full'.
