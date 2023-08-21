   0:# INIT TABLES
  18:# 
  19:# ======= START RUNG 1 =======
  20:LabelRung1:
  21:
  22:set bit '$rung_top'
  24:# start series [
  25:# ELEM_CONTACTS
  26:if not 'XPB1' {
  27:    clear bit '$rung_top'
  28:}
  30:# start parallel [
  31:clear bit '$parOut_0'
  32:let bit '$parThis_0' := '$rung_top'
  33:# start series [
  34:# ELEM_CONTACTS
  35:if 'XS1' {
  36:    clear bit '$parThis_0'
  37:}
  39:# ELEM_ONE_SHOT_RISING
  40:if '$parThis_0' {
  41:    if '$once_0_ONE_SHOT_RISING' {
  42:        clear bit '$parThis_0'
  43:    } else {
  44:        set bit '$once_0_ONE_SHOT_RISING'
  45:    }
  46:} else {
  47:    clear bit '$once_0_ONE_SHOT_RISING'
  48:}
  50:# ] finish series
  51:if '$parThis_0' {
  52:    set bit '$parOut_0'
  53:}
  54:let bit '$parThis_0' := '$rung_top'
  55:# ELEM_CONTACTS
  56:if not 'RIR11' {
  57:    clear bit '$parThis_0'
  58:}
  60:if '$parThis_0' {
  61:    set bit '$parOut_0'
  62:}
  63:let bit '$rung_top' := '$parOut_0'
  64:# ] finish parallel
  65:# ELEM_CONTACTS
  66:if 'RIR12' {
  67:    clear bit '$rung_top'
  68:}
  70:# ELEM_COIL
  71:let bit 'RIR11' := '$rung_top'
  73:# ] finish series
  74:# 
  75:# ======= START RUNG 2 =======
  76:LabelRung2:
  77:
  78:set bit '$rung_top'
  80:# start series [
  81:# ELEM_CONTACTS
  82:if not 'RIR11' {
  83:    clear bit '$rung_top'
  84:}
  86:# ELEM_TON T1 5000000
  87:if '$rung_top' {
  88:    if 'T1' < '500' {
  89:        clear bit '$rung_top'
  90:        increment 'T1'
  91:    }
  92:} else {
  93:    let var 'T1' := 0
  94:}
  96:# ELEM_COIL
  97:let bit 'RIR12' := '$rung_top'
  99:# ] finish series
 100:# 
 101:# ======= START RUNG 3 =======
 102:LabelRung3:
 103:
 104:set bit '$rung_top'
 106:# start series [
 107:# ELEM_CONTACTS
 108:if not 'RIR11' {
 109:    clear bit '$rung_top'
 110:}
 112:# ELEM_COIL
 113:if '$rung_top' {
 114:    clear bit 'YR1'
 115:} else {
 116:    set bit 'YR1'
 117:}
 119:# ] finish series
 120:# 
 121:# ======= START RUNG 4 =======
 122:LabelRung4:
 123:
 124:set bit '$rung_top'
 126:# start series [
 127:# ELEM_CONTACTS
 128:if 'RIR11' {
 129:    clear bit '$rung_top'
 130:}
 132:# ELEM_COIL
 133:if '$rung_top' {
 134:    clear bit 'YR2'
 135:} else {
 136:    set bit 'YR2'
 137:}
 139:# ] finish series
 140:# 
 141:# ======= START RUNG 5 =======
 142:LabelRung5:
 143:
 144:set bit '$rung_top'
 146:# start series [
 147:# ELEM_CONTACTS
 148:if not 'XPB2' {
 149:    clear bit '$rung_top'
 150:}
 152:# start parallel [
 153:clear bit '$parOut_1'
 154:let bit '$parThis_1' := '$rung_top'
 155:# start series [
 156:# ELEM_CONTACTS
 157:if 'XS2' {
 158:    clear bit '$parThis_1'
 159:}
 161:# ELEM_ONE_SHOT_RISING
 162:if '$parThis_1' {
 163:    if '$once_1_ONE_SHOT_RISING' {
 164:        clear bit '$parThis_1'
 165:    } else {
 166:        set bit '$once_1_ONE_SHOT_RISING'
 167:    }
 168:} else {
 169:    clear bit '$once_1_ONE_SHOT_RISING'
 170:}
 172:# ] finish series
 173:if '$parThis_1' {
 174:    set bit '$parOut_1'
 175:}
 176:let bit '$parThis_1' := '$rung_top'
 177:# ELEM_CONTACTS
 178:if not 'RIR21' {
 179:    clear bit '$parThis_1'
 180:}
 182:if '$parThis_1' {
 183:    set bit '$parOut_1'
 184:}
 185:let bit '$rung_top' := '$parOut_1'
 186:# ] finish parallel
 187:# ELEM_CONTACTS
 188:if 'RIR22' {
 189:    clear bit '$rung_top'
 190:}
 192:# ELEM_COIL
 193:let bit 'RIR21' := '$rung_top'
 195:# ] finish series
 196:# 
 197:# ======= START RUNG 6 =======
 198:LabelRung6:
 199:
 200:set bit '$rung_top'
 202:# start series [
 203:# ELEM_CONTACTS
 204:if not 'RIR21' {
 205:    clear bit '$rung_top'
 206:}
 208:# ELEM_TON T2 5000000
 209:if '$rung_top' {
 210:    if 'T2' < '500' {
 211:        clear bit '$rung_top'
 212:        increment 'T2'
 213:    }
 214:} else {
 215:    let var 'T2' := 0
 216:}
 218:# ELEM_COIL
 219:let bit 'RIR22' := '$rung_top'
 221:# ] finish series
 222:# 
 223:# ======= START RUNG 7 =======
 224:LabelRung7:
 225:
 226:set bit '$rung_top'
 228:# start series [
 229:# ELEM_CONTACTS
 230:if not 'RIR21' {
 231:    clear bit '$rung_top'
 232:}
 234:# ELEM_COIL
 235:if '$rung_top' {
 236:    clear bit 'YR3'
 237:} else {
 238:    set bit 'YR3'
 239:}
 241:# ] finish series
 242:# 
 243:# ======= START RUNG 8 =======
 244:LabelRung8:
 245:
 246:set bit '$rung_top'
 248:# start series [
 249:# ELEM_CONTACTS
 250:if 'RIR21' {
 251:    clear bit '$rung_top'
 252:}
 254:# ELEM_COIL
 255:if '$rung_top' {
 256:    clear bit 'YR4'
 257:} else {
 258:    set bit 'YR4'
 259:}
 261:# ] finish series
 262:# 
 263:# ======= START RUNG 9 =======
 264:LabelRung9:
 265:
 266:set bit '$rung_top'
 268:# start series [
 269:# ELEM_CONTACTS
 270:if not 'XPB3' {
 271:    clear bit '$rung_top'
 272:}
 274:# start parallel [
 275:clear bit '$parOut_2'
 276:let bit '$parThis_2' := '$rung_top'
 277:# start series [
 278:# ELEM_CONTACTS
 279:if 'XS3' {
 280:    clear bit '$parThis_2'
 281:}
 283:# ELEM_ONE_SHOT_RISING
 284:if '$parThis_2' {
 285:    if '$once_2_ONE_SHOT_RISING' {
 286:        clear bit '$parThis_2'
 287:    } else {
 288:        set bit '$once_2_ONE_SHOT_RISING'
 289:    }
 290:} else {
 291:    clear bit '$once_2_ONE_SHOT_RISING'
 292:}
 294:# ] finish series
 295:if '$parThis_2' {
 296:    set bit '$parOut_2'
 297:}
 298:let bit '$parThis_2' := '$rung_top'
 299:# ELEM_CONTACTS
 300:if not 'RIR31' {
 301:    clear bit '$parThis_2'
 302:}
 304:if '$parThis_2' {
 305:    set bit '$parOut_2'
 306:}
 307:let bit '$rung_top' := '$parOut_2'
 308:# ] finish parallel
 309:# ELEM_CONTACTS
 310:if 'RIR32' {
 311:    clear bit '$rung_top'
 312:}
 314:# ELEM_COIL
 315:let bit 'RIR31' := '$rung_top'
 317:# ] finish series
 318:# 
 319:# ======= START RUNG 10 =======
 320:LabelRung10:
 321:
 322:set bit '$rung_top'
 324:# start series [
 325:# ELEM_CONTACTS
 326:if not 'RIR31' {
 327:    clear bit '$rung_top'
 328:}
 330:# ELEM_TON T3 5000000
 331:if '$rung_top' {
 332:    if 'T3' < '500' {
 333:        clear bit '$rung_top'
 334:        increment 'T3'
 335:    }
 336:} else {
 337:    let var 'T3' := 0
 338:}
 340:# ELEM_COIL
 341:let bit 'RIR32' := '$rung_top'
 343:# ] finish series
 344:# 
 345:# ======= START RUNG 11 =======
 346:LabelRung11:
 347:
 348:set bit '$rung_top'
 350:# start series [
 351:# ELEM_CONTACTS
 352:if not 'RIR31' {
 353:    clear bit '$rung_top'
 354:}
 356:# ELEM_COIL
 357:if '$rung_top' {
 358:    clear bit 'YR5'
 359:} else {
 360:    set bit 'YR5'
 361:}
 363:# ] finish series
 364:# 
 365:# ======= START RUNG 12 =======
 366:LabelRung12:
 367:
 368:set bit '$rung_top'
 370:# start series [
 371:# ELEM_CONTACTS
 372:if 'RIR31' {
 373:    clear bit '$rung_top'
 374:}
 376:# ELEM_COIL
 377:if '$rung_top' {
 378:    clear bit 'YR6'
 379:} else {
 380:    set bit 'YR6'
 381:}
 383:# ] finish series
 384:# 
 385:# ======= START RUNG 13 =======
 386:LabelRung13:
 387:
 388:set bit '$rung_top'
 390:# start series [
 391:# ELEM_CONTACTS
 392:if not 'XPB4' {
 393:    clear bit '$rung_top'
 394:}
 396:# start parallel [
 397:clear bit '$parOut_3'
 398:let bit '$parThis_3' := '$rung_top'
 399:# start series [
 400:# ELEM_CONTACTS
 401:if 'XS4' {
 402:    clear bit '$parThis_3'
 403:}
 405:# ELEM_ONE_SHOT_RISING
 406:if '$parThis_3' {
 407:    if '$once_3_ONE_SHOT_RISING' {
 408:        clear bit '$parThis_3'
 409:    } else {
 410:        set bit '$once_3_ONE_SHOT_RISING'
 411:    }
 412:} else {
 413:    clear bit '$once_3_ONE_SHOT_RISING'
 414:}
 416:# ] finish series
 417:if '$parThis_3' {
 418:    set bit '$parOut_3'
 419:}
 420:let bit '$parThis_3' := '$rung_top'
 421:# ELEM_CONTACTS
 422:if not 'RIR41' {
 423:    clear bit '$parThis_3'
 424:}
 426:if '$parThis_3' {
 427:    set bit '$parOut_3'
 428:}
 429:let bit '$rung_top' := '$parOut_3'
 430:# ] finish parallel
 431:# ELEM_CONTACTS
 432:if 'RIR42' {
 433:    clear bit '$rung_top'
 434:}
 436:# ELEM_COIL
 437:let bit 'RIR41' := '$rung_top'
 439:# ] finish series
 440:# 
 441:# ======= START RUNG 14 =======
 442:LabelRung14:
 443:
 444:set bit '$rung_top'
 446:# start series [
 447:# ELEM_CONTACTS
 448:if not 'RIR41' {
 449:    clear bit '$rung_top'
 450:}
 452:# ELEM_TON T4 5000000
 453:if '$rung_top' {
 454:    if 'T4' < '500' {
 455:        clear bit '$rung_top'
 456:        increment 'T4'
 457:    }
 458:} else {
 459:    let var 'T4' := 0
 460:}
 462:# ELEM_COIL
 463:let bit 'RIR42' := '$rung_top'
 465:# ] finish series
 466:# 
 467:# ======= START RUNG 15 =======
 468:LabelRung15:
 469:
 470:set bit '$rung_top'
 472:# start series [
 473:# ELEM_CONTACTS
 474:if not 'RIR41' {
 475:    clear bit '$rung_top'
 476:}
 478:# ELEM_COIL
 479:if '$rung_top' {
 480:    clear bit 'YR7'
 481:} else {
 482:    set bit 'YR7'
 483:}
 485:# ] finish series
 486:# 
 487:# ======= START RUNG 16 =======
 488:LabelRung16:
 489:
 490:set bit '$rung_top'
 492:# start series [
 493:# ELEM_CONTACTS
 494:if 'RIR41' {
 495:    clear bit '$rung_top'
 496:}
 498:# ELEM_COIL
 499:if '$rung_top' {
 500:    clear bit 'YR8'
 501:} else {
 502:    set bit 'YR8'
 503:}
 505:# ] finish series
 506:LabelRung17:
 507:
 508:# Latest INT_OP here
