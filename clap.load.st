"-*- mode: smalltalk; -*-"
Metacello new baseline: #StateSpecs;
  repository: 'github://dionisiydk/StateSpecs:dev';
  lock; load.

Metacello new baseline: #Clap;
  repository: 'gitlocal://.';
  onLock: #honor; load.
