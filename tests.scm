(BOR #t #t)
(BOR #t #f)
(BOR #f #t)
(BOR #f #f)


(BAND #t #t)
(BAND #t #f)
(BAND #f #t)
(BAND #f #f)


(pos? -1)
(pos? 0)
(pos? 1)

(in? 'b '(a b c))
(in? 'x '(a b c))

(in? '1 '(3 2 1))
(in? '66 '(a 2 43))


(reduce + '(1 2 3 4 5))
(reduce + '(2))
(reduce BOR '(#t #t #f #t #f))
(reduce BAND '(#t #t #f #t #f))

(filter pos? '(1 3 -3 5 -6 7))
(filter pos? '(-1 -2 -3))
(filter pos? '(1 2 3 4))

(det? 'happy)
(det? 'a)
(det? 'the)

(noun? 'happy)
(noun? 'apple)
(noun? 'truck)


(adj? 'poop)
(adj? 'black)
(adj? 'red)

(verb? 'poop)
(verb? 'stops)
(verb? 'walks)

(prep? 'poop)
(prep? 'around)
(prep? 'under)


(reduce BOR (map det? '(hot red car)))
(reduce BOR (map det? '(the red car is a hot dog)))


(OK '(hairy red hot red))
(OK '(a dog occupies the car))
(OK '(a hairy red dog occupies the hot red car))
(OK '(a red car rides the road))


(det '(hairy red hot red))
(det '(a dog occupies the car))


(adj '(hairy red dog))        ; Value: (red dog)
(det '(red car))              ; Value: ()
(adj (adj '(hairy red dog)))  ; Value: (dog)
(noun (det '(a dog $)))       ; Value: ($)



(nounphrase1 '(a dog PASSED TEST 1))
(nounphrase1 '(red dog PASSED TEST 2))
(nounphrase1 '(dog PASSED TEST 3))
(nounphrase1 '(a red dog PASSED TEST 4))
(sentence '(the red dog rides a hot car PASSED TEST 5))
(sentence '(a rides car FAILED TEST 6))
(sentence '(the hairy hot red dog eats a red hot hot hot apple PASSED TEST 7))
(sentence '(the hairy hot red dog walks))
(sentence '(an apple FAILED TEST 9))
(sentence '(a red dog FAILED TEST 10))
(sentence '(dog eats))
(sentence '(the quick red fox jumps over the brown cow PASSED TEST 12))
(sentence '(fox jumps over the brown cow PASSED TEST 13))
(sentence '(fox jumps cow PASSED TEST 14))

(verbphrase '(commutes around a black brown bicycle PASSED TEST))
(verbphrase '(commutes around a black bicycle PASSED TEST))
(verbphrase '(makes to slow hairy cow PASSED TEST))
(verbphrase '(makes to slow cow PASSED TEST))
(verbphrase '(stops the hot fast  bicycle PASSED TEST))
(verbphrase '(stops the hot bicycle PASSED TEST))
(verbphrase '(walks red quick road PASSED TEST))
(verbphrase '(walks red road PASSED TEST))

(verbphrase '(eats at an motorcycle PASSED TEST))
(verbphrase '(occupies the path PASSED TEST))
(verbphrase '(travels a fox PASSED TEST))
(verbphrase '(destroys pie PASSED TEST))
(verbphrase '(drives PASSED TEST))

(verbphrase '(a dog eats FAILED TEST))
(verbphrase '(a dog eats run))
(verbphrase '(a dog eats))



