"-*- mode: smalltalk; -*-"
Metacello new baseline: #StateSpecs;
  repository: 'github://cdlm/StateSpecs:resumable-specoffailed-tests';
  lock.

Metacello new baseline: #Clap;
  repository: 'gitlocal://.';
  onLock: #honor; load.
