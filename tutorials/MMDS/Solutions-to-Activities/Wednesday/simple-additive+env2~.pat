max v2;#N vpatcher -21 59 1259 782;#P origin 67 0;#P window setfont "Sans Serif" 14.;#P comment 971 287 263 196622 <-- that float goes to env-stretcher \, from the Envelope-Player patch;#B color 14;#N vpatcher 40 55 335 299;#N comlet Time stretch factor;#P inlet 243 32 15 0;#P window setfont "Sans Serif" 18.;#P newex 36 152 113 196626 interleave 2;#P newex 161 107 92 196626 Lmult 1.;#P newex 36 58 135 196626 deinterleave 2;#N comlet Output envelope;#P outlet 36 190 15 0;#N comlet Input envelope;#P inlet 36 32 15 0;#P connect 0 0 2 0;#P connect 2 0 4 0;#P connect 4 0 1 0;#P connect 3 0 4 1;#P connect 2 1 3 0;#P connect 5 0 3 1;#P pop;#P newobj 824 285 145 196622 p env-stretcher;#B color 14;#P newex 824 331 44 196622 t l 0;#B color 14;#N coll envelopes.coll;#P newobj 824 228 168 196622 coll envelopes.coll;#B color 14;#P outlet 124 471 15 0;#P newex 824 381 42 196622 line~;#B color 14;#P newex 131 137 34 196622 * 0.;#P window setfont "Sans Serif" 9.;#P comment 60 53 32 196617 slope;#P comment 211 51 468 196617 the third through tenth list elements are frequency ratios \, multiplied by the fundamental frequency.;#P window setfont "Sans Serif" 14.;#P comment 775 306 35 196622 s^7;#P comment 687 306 35 196622 s^6;#P comment 601 306 35 196622 s^5;#P comment 514 304 35 196622 s^4;#P comment 426 304 35 196622 s^3;#P comment 339 303 35 196622 s^2;#P newex 740 306 34 196622 * 0.;#P newex 653 305 34 196622 * 0.;#P newex 566 304 34 196622 * 0.;#P newex 479 303 34 196622 * 0.;#P newex 392 302 34 196622 * 0.;#P newex 305 303 34 196622 * 0.;#P newex 218 228 27 196622 f;#P window setfont "Sans Serif" 9.;#P newex 131 437 703 196617 *~;#P window setfont "Sans Serif" 14.;#P newex 723 138 34 196622 * 0.;#P newex 723 349 27 196622 *~;#P newex 723 165 55 196622 cycle~;#P newex 636 138 34 196622 * 0.;#P newex 636 349 27 196622 *~;#P newex 636 165 55 196622 cycle~;#P newex 549 138 34 196622 * 0.;#P newex 549 349 27 196622 *~;#P newex 549 165 55 196622 cycle~;#P newex 462 138 34 196622 * 0.;#P newex 462 349 27 196622 *~;#P newex 462 165 55 196622 cycle~;#P newex 375 138 34 196622 * 0.;#P newex 375 349 27 196622 *~;#P newex 375 165 55 196622 cycle~;#P newex 288 138 34 196622 * 0.;#P newex 201 139 34 196622 * 0.;#P newex 288 349 27 196622 *~;#P newex 288 165 55 196622 cycle~;#P newex 201 349 27 196622 *~;#P newex 54 65 866 196622 unpack f f f f f f f f f f s f;#N comlet list (slope \, base freq \, 8 ratios);#P inlet 54 25 15 0;#P newex 201 165 55 196622 cycle~;#P newex 131 165 55 196622 cycle~;#P comment 225 207 72 196622 s (slope);#P window setfont "Sans Serif" 9.;#P comment 96 53 111 196617 fundamental frequency;#P comment 4 212 123 196617 The amplitudes of each partial are s^n \, where 'n' \, where 'n' is the partial number. The first one is s^0 \, or 1 \, so we don't need to multiply anything. The second one is s^1 \, so we just multiply the signal by the slope. The others are s^2...s^7.;#P window setfont "Sans Serif" 18.;#P comment 866 525 317 196626 |<---------- newer new stuff ---------->|;#B color 14;#P window setfont "Sans Serif" 14.;#P comment 935 66 279 196622 <-- yet another item in the list \, a floating point number for "envelope length in seconds.";#B color 14;#P user panel 802 38 448 534;#X brgb 255 255 255;#X frgb 245 125 255;#X border 5;#X rounded 40;#X shadow 0;#X done;#P background;#P connect 8 0 9 0;#P connect 30 0 48 0;#P connect 9 1 46 0;#P connect 46 0 6 0;#P connect 28 0 30 0;#P connect 25 0 30 0;#P connect 22 0 30 0;#P connect 19 0 30 0;#P connect 16 0 30 0;#P connect 12 0 30 0;#P connect 10 0 30 0;#P connect 6 0 30 0;#P connect 9 2 46 1;#P connect 9 1 13 0;#P connect 13 0 7 0;#P connect 7 0 10 0;#P fasten 9 0 31 0 59 203 223 203;#P connect 31 0 10 1;#P connect 9 3 13 1;#P connect 9 1 14 0;#P connect 14 0 11 0;#P connect 11 0 12 0;#P connect 31 0 32 0;#P connect 32 0 12 1;#P connect 9 4 14 1;#P connect 31 0 32 1;#P connect 9 1 17 0;#P connect 17 0 15 0;#P connect 15 0 16 0;#P fasten 32 0 33 0 310 327 378 327 378 298 397 298;#P connect 33 0 16 1;#P connect 9 5 17 1;#P connect 31 0 33 1;#P connect 9 1 20 0;#P connect 20 0 18 0;#P connect 18 0 19 0;#P fasten 33 0 34 0 397 327 465 327 465 300 484 300;#P connect 34 0 19 1;#P connect 9 6 20 1;#P connect 31 0 34 1;#P connect 9 1 23 0;#P connect 23 0 21 0;#P connect 21 0 22 0;#P fasten 34 0 35 0 484 328 555 328 555 302 571 302;#P connect 35 0 22 1;#P connect 9 7 23 1;#P connect 31 0 35 1;#P connect 9 1 26 0;#P connect 26 0 24 0;#P connect 24 0 25 0;#P fasten 35 0 36 0 571 328 644 328 644 303 658 303;#P connect 36 0 25 1;#P connect 9 8 26 1;#P connect 31 0 36 1;#P connect 9 1 29 0;#P connect 29 0 27 0;#P connect 27 0 28 0;#P fasten 36 0 37 0 658 328 732 328 732 303 745 303;#P connect 37 0 28 1;#P connect 9 9 29 1;#P connect 31 0 37 1;#P connect 9 10 49 0;#P lcolor 15;#P connect 49 0 51 0;#P lcolor 15;#P connect 51 0 50 0;#P lcolor 15;#P connect 50 0 47 0;#P lcolor 15;#P connect 50 1 47 0;#P lcolor 15;#P connect 47 0 30 1;#P fasten 9 11 51 1 906 185 1039 185 1039 277 964 277;#P lcolor 15;#P pop;