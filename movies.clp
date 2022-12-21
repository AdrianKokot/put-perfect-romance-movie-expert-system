(defrule start
   (and (not (exists
                  (wynik ? $?)))
        (not (exists
                  (pytanie ? $?)))
        (not (exists
                  (odpowiedz ?))))
   =>
   (assert (pytanie "Classic or modern?" "I need an escape from Tinder." "I'm a modern girl.")))

(defrule need-an-escape
   ?id <- (odpowiedz "I need an escape from Tinder.")
   ?pid <- (pytanie "Classic or modern?" "I need an escape from Tinder." "I'm a modern girl.")
   =>
   (retract ?id)
   (retract ?pid)
   (assert (pytanie "Black and white?" "Definitely, love oldies!" "Lets go more modern.")))

(defrule modern-girl
   ?id <- (odpowiedz "I'm a modern girl.")
   ?pid <- (pytanie "Classic or modern?" "I need an escape from Tinder." "I'm a modern girl.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Comedy or drama?" "I need a good laugh." "How about some action?" "Let's add some drama.")))

(defrule love-oldies
   ?id <- (odpowiedz "Definitely, love oldies!")
   ?pid <- (pytanie "Black and white?" "Definitely, love oldies!" "Lets go more modern.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "A tale of friends or strangers?" "Strangers." "Friends.")))

(defrule go-more-modern
   ?id <- (odpowiedz "Lets go more modern.")
   ?pid <- (pytanie "Black and white?" "Definitely, love oldies!" "Lets go more modern.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Based on a novel?" "Not so much." "I'm kind of a book worm.")))

(defrule strangers
   ?id <- (odpowiedz "Strangers.")
   ?pid <- (pytanie "A tale of friends or strangers?" "Strangers." "Friends.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Do they get together on the end?" "Please say yes!" "NBD.")))

(defrule friends
   ?id <- (odpowiedz "Friends.")
   ?pid <- (pytanie "A tale of friends or strangers?" "Strangers." "Friends.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Terms of Endearment")))

(defrule not-so-much
   ?id <- (odpowiedz "Not so much.")
   ?pid <- (pytanie "Based on a novel?" "Not so much." "I'm kind of a book worm.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Your thoughts on the '90s?" "Let's go earlier." "Greatest years of my life.")))

(defrule kind-of-a-book-worm
   ?id <- (odpowiedz "I'm kind of a book worm.")
   ?pid <- (pytanie "Based on a novel?" "Not so much." "I'm kind of a book worm.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "New or old?" "New." "Old.")))

(defrule need-a-good-laugh
   ?id <- (odpowiedz "I need a good laugh.")
   ?pid <- (pytanie "Comedy or drama?" "I need a good laugh." "How about some action?" "Let's add some drama.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Like adventures?" "Prefer a different storyline." "Who doesn't!?")))

(defrule how-about-some-action
   ?id <- (odpowiedz "How about some action?")
   ?pid <- (pytanie "Comedy or drama?" "I need a good laugh." "How about some action?" "Let's add some drama.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "What kind of action?" "A thrilling twist!" "Love a little risque!")))

(defrule add-some-drama
   ?id <- (odpowiedz "Let's add some drama.")
   ?pid <- (pytanie "Comedy or drama?" "I need a good laugh." "How about some action?" "Let's add some drama.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Is your life at a crossroads?" "My life is a pretty stable." "When is it not?")))

(defrule please-sey-yes
   ?id <- (odpowiedz "Please say yes!")
   ?pid <- (pytanie "Do they get together on the end?" "Please say yes!" "NBD.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Breakfast at Tiffany's")))

(defrule nbd
   ?id <- (odpowiedz "NBD.")
   ?pid <- (pytanie "Do they get together on the end?" "Please say yes!" "NBD.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Roman Holiday")))

(defrule new
   ?id <- (odpowiedz "New.")
   ?pid <- (pytanie "New or old?" "New." "Old.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Based in the U.S. or Mexico?" "U.S." "Viva Mexico!")))

(defrule old
   ?id <- (odpowiedz "Old.")
   ?pid <- (pytanie "New or old?" "New." "Old.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Author Bronte or Austen?" "I prefer Russian literature." "Emily Bronte is my queen." "Jane Austen all the way.")))

(defrule thrilling-twist
   ?id <- (odpowiedz "A thrilling twist!")
   ?pid <- (pytanie "What kind of action?" "A thrilling twist!" "Love a little risque!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Charlie Countryman")))

(defrule love-a-little-risque
   ?id <- (odpowiedz "Love a little risque!")
   ?pid <- (pytanie "What kind of action?" "A thrilling twist!" "Love a little risque!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "One couple or multiple?" "One." "The more, the merrier!")))

(defrule u-s
   ?id <- (odpowiedz "U.S.")
   ?pid <- (pytanie "Based in the U.S. or Mexico?" "U.S." "Viva Mexico!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "The Great Gatsby (1974)")))

(defrule viva-mexico
   ?id <- (odpowiedz "Viva Mexico!")
   ?pid <- (pytanie "Based in the U.S. or Mexico?" "U.S." "Viva Mexico!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Like Water for Chocolate")))

(defrule one
   ?id <- (odpowiedz "One.")
   ?pid <- (pytanie "One couple or multiple?" "One." "The more, the merrier!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Perfect Sense")))

(defrule more-the-merrier
   ?id <- (odpowiedz "The more, the merrier!")
   ?pid <- (pytanie "One couple or multiple?" "One." "The more, the merrier!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "The Little Death")))

(defrule lets-go-earlier
   ?id <- (odpowiedz "Let's go earlier.")
   ?pid <- (pytanie "Your thoughts on the '90s?" "Let's go earlier." "Greatest years of my life.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Ah, period piece it is. Biography?" "Pass." "Ok!")))

(defrule greatest-years-of-my-life
   ?id <- (odpowiedz "Greatest years of my life.")
   ?pid <- (pytanie "Your thoughts on the '90s?" "Let's go earlier." "Greatest years of my life.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Deep passion or innocent love?" "Deep passion!" "Innocent love?")))

(defrule prefer-russian-literature
   ?id <- (odpowiedz "I prefer Russian literature.")
   ?pid <- (pytanie "Author Bronte or Austen?" "I prefer Russian literature." "Emily Bronte is my queen." "Jane Austen all the way.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Anna Kerenina")))

(defrule bronte-is-my-queen
   ?id <- (odpowiedz "Emily Bronte is my queen.")
   ?pid <- (pytanie "Author Bronte or Austen?" "I prefer Russian literature." "Emily Bronte is my queen." "Jane Austen all the way.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Like love triangles?" "I LOVE love triangles." "Pass.")))

(defrule austen-all-the-way
   ?id <- (odpowiedz "Jane Austen all the way.")
   ?pid <- (pytanie "Author Bronte or Austen?" "I prefer Russian literature." "Emily Bronte is my queen." "Jane Austen all the way.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Mansfield Park")))

(defrule prefer-a-different-storyline
   ?id <- (odpowiedz "Prefer a different storyline.")
   ?pid <- (pytanie "Like adventures?" "Prefer a different storyline." "Who doesn't!?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Quest for love or Fish out of water?" "Quest for love?" "Fish out of water?")))

(defrule who-doesnt
   ?id <- (odpowiedz "Who doesn't!?")
   ?pid <- (pytanie "Like adventures?" "Prefer a different storyline." "Who doesn't!?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Moonrise Kingdom")))

(defrule pass-shakespeare
   ?id <- (odpowiedz "Pass.")
   ?pid <- (pytanie "Ah, period piece it is. Biography?" "Pass." "Ok!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Shakespeare In Love")))

(defrule ok-biography
   ?id <- (odpowiedz "Ok!")
   ?pid <- (pytanie "Ah, period piece it is. Biography?" "Pass." "Ok!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Art or film?" "Art!" "Film!")))

(defrule love-love-triangles
   ?id <- (odpowiedz "I LOVE love triangles.")
   ?pid <- (pytanie "Like love triangles?" "I LOVE love triangles." "Pass.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Wuthering Heights")))

(defrule pass-jane
   ?id <- (odpowiedz "Pass.")
   ?pid <- (pytanie "Like love triangles?" "I LOVE love triangles." "Pass.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Jane Eyre")))

(defrule art
   ?id <- (odpowiedz "Art!")
   ?pid <- (pytanie "Art or film?" "Art!" "Film!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Frida")))

(defrule film
   ?id <- (odpowiedz "Film!")
   ?pid <- (pytanie "Art or film?" "Art!" "Film!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Marilyn")))

(defrule quest-for-love
   ?id <- (odpowiedz "Quest for love?")
   ?pid <- (pytanie "Quest for love or Fish out of water?" "Quest for love?" "Fish out of water?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Quest for love?" "Yes." "Nah.")))

(defrule fish-out-of-water
   ?id <- (odpowiedz "Fish out of water?")
   ?pid <- (pytanie "Quest for love or Fish out of water?" "Quest for love?" "Fish out of water?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Fish out of water?" "Ooo... tell me more!" "No.")))

(defrule yes-quest
   ?id <- (odpowiedz "Yes.")
   ?pid <- (pytanie "Quest for love?" "Yes." "Nah.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Tropical paradise?" "Dreaming of Hawaii." "I'm a fan of winter.")))

(defrule nah-quest
   ?id <- (odpowiedz "Nah.")
   ?pid <- (pytanie "Quest for love?" "Yes." "Nah.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Are the characters dating someone?" "No to cheaters!" "Well...")))

(defrule tell-me-more
   ?id <- (odpowiedz "Ooo... tell me more!")
   ?pid <- (pytanie "Fish out of water?" "Ooo... tell me more!" "No.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Take me to Queens!" "Yes!!" "Huh?")))

(defrule no-fish
   ?id <- (odpowiedz "No.")
   ?pid <- (pytanie "Fish out of water?" "Ooo... tell me more!" "No.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Pining for Christmas already?" "Bring on the mistletoe!" "Not so much.")))

(defrule dreaming-of-hawaii
   ?id <- (odpowiedz "Dreaming of Hawaii.")
   ?pid <- (pytanie "Tropical paradise?" "Dreaming of Hawaii." "I'm a fan of winter.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "50 First Dates")))

(defrule fan-of-winter
   ?id <- (odpowiedz "I'm a fan of winter.")
   ?pid <- (pytanie "Tropical paradise?" "Dreaming of Hawaii." "I'm a fan of winter.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Bridget Jones's Diary")))

(defrule deep-passion
   ?id <- (odpowiedz "Deep passion!")
   ?pid <- (pytanie "Deep passion or innocent love?" "Deep passion!" "Innocent love?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Do you like ghosts?" "Bring it!" "No.")))

(defrule innocent-love
   ?id <- (odpowiedz "Innocent love?")
   ?pid <- (pytanie "Deep passion or innocent love?" "Deep passion!" "Innocent love?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Small town or big city?" "Big city." "Small town.")))

(defrule yes-queens
   ?id <- (odpowiedz "Yes!!")
   ?pid <- (pytanie "Take me to Queens!" "Yes!!" "Huh?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Coming to America")))

(defrule huh
   ?id <- (odpowiedz "Huh?")
   ?pid <- (pytanie "Take me to Queens!" "Yes!!" "Huh?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Spanglish")))

(defrule bring-it
   ?id <- (odpowiedz "Bring it!")
   ?pid <- (pytanie "Do you like ghosts?" "Bring it!" "No.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Ghost")))

(defrule no-ghosts
   ?id <- (odpowiedz "No.")
   ?pid <- (pytanie "Do you like ghosts?" "Bring it!" "No.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Jerry Maguire")))

(defrule on-the-mistletoe
   ?id <- (odpowiedz "Bring on the mistletoe!")
   ?pid <- (pytanie "Pining for Christmas already?" "Bring on the mistletoe!" "Not so much.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Single and ready to mingle?" "I prefer dating." "Sure!")))

(defrule not-so-much-pining
   ?id <- (odpowiedz "Not so much.")
   ?pid <- (pytanie "Pining for Christmas already?" "Bring on the mistletoe!" "Not so much.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Pick a Jennifer." "Lopez!" "Garner!")))

(defrule no-to-cheaters
   ?id <- (odpowiedz "No to cheaters!")
   ?pid <- (pytanie "Are the characters dating someone?" "No to cheaters!" "Well...")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Sparked by a note?" "Yes!" "No.")))

(defrule well
   ?id <- (odpowiedz "Well...")
   ?pid <- (pytanie "Are the characters dating someone?" "No to cheaters!" "Well...")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Will he propose?" "Umm... he already did?" "Nope.")))

(defrule big-city
   ?id <- (odpowiedz "Big city.")
   ?pid <- (pytanie "Small town or big city?" "Big city." "Small town.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Clueless")))

(defrule small-town
   ?id <- (odpowiedz "Small town.")
   ?pid <- (pytanie "Small town or big city?" "Big city." "Small town.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "A love that lasts decades?" "Let's cut to the chase." "Love should last forever!")))

(defrule i-prefer-dating
   ?id <- (odpowiedz "I prefer dating.")
   ?pid <- (pytanie "Single and ready to mingle?" "I prefer dating." "Sure!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Groundhog Day theme?" "Okay." "No thanks.")))

(defrule sure
   ?id <- (odpowiedz "Sure!")
   ?pid <- (pytanie "Single and ready to mingle?" "I prefer dating." "Sure!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Marry Me for Christmas")))

(defrule lopez
   ?id <- (odpowiedz "Lopez!")
   ?pid <- (pytanie "Pick a Jennifer." "Lopez!" "Garner!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Maid in Manhattan")))

(defrule garner
   ?id <- (odpowiedz "Garner!")
   ?pid <- (pytanie "Pick a Jennifer." "Lopez!" "Garner!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "13 going on 30")))

(defrule yes-sparked
   ?id <- (odpowiedz "Yes!")
   ?pid <- (pytanie "Sparked by a note?" "Yes!" "No.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "The Love Letter")))

(defrule no-sparked
   ?id <- (odpowiedz "No.")
   ?pid <- (pytanie "Sparked by a note?" "Yes!" "No.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Serendipity")))

(defrule cut-to-the-chase
   ?id <- (odpowiedz "Let's cut to the chase.")
   ?pid <- (pytanie "A love that lasts decades?" "Let's cut to the chase." "Love should last forever!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "What's Eating Gilbert Grape?")))

(defrule should-last-forever
   ?id <- (odpowiedz "Love should last forever!")
   ?pid <- (pytanie "A love that lasts decades?" "Let's cut to the chase." "Love should last forever!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Forrest Gump")))

(defrule okay-groundhog
   ?id <- (odpowiedz "Okay.")
   ?pid <- (pytanie "Groundhog Day theme?" "Okay." "No thanks.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "12 Dates of Christmas")))

(defrule no-thanks
   ?id <- (odpowiedz "No thanks.")
   ?pid <- (pytanie "Groundhog Day theme?" "Okay." "No thanks.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Love Actually")))

(defrule he-already-did
   ?id <- (odpowiedz "Umm... he already did?")
   ?pid <- (pytanie "Will he propose?" "Umm... he already did?" "Nope.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "My Best Friend's Wedding")))

(defrule nope
   ?id <- (odpowiedz "Nope.")
   ?pid <- (pytanie "Will he propose?" "Umm... he already did?" "Nope.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Do you like beer?" "Yes!!" "Nope.")))

(defrule yes-beer
   ?id <- (odpowiedz "Yes!!")
   ?pid <- (pytanie "Do you like beer?" "Yes!!" "Nope.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Drinking Buddies")))

(defrule nope-beer
   ?id <- (odpowiedz "Nope.")
   ?pid <- (pytanie "Do you like beer?" "Yes!!" "Nope.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Leap Year")))

(defrule pretty-stable
   ?id <- (odpowiedz "My life is pretty stable.")
   ?pid <- (pytanie "Is your life at a crossroads?" "My life is a pretty stable." "When is it not?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Are you sure?" "Yes!" "Ok, maybe not...")))

(defrule when-is-it-not
   ?id <- (odpowiedz "When is it not?")
   ?pid <- (pytanie "Is your life at a crossroads?" "My life is a pretty stable." "When is it not?")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Like Sci-Fi?" "Sure!" "Nope.")))

(defrule yes-sure
   ?id <- (odpowiedz "Yes!")
   ?pid <- (pytanie "Are you sure?" "Yes!" "Ok, maybe not...")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "You get one lifeline. Who do you call?" "Friends!" "Bros.")))

(defrule ok-maybe-not
   ?id <- (odpowiedz "Ok, maybe not...")
   ?pid <- (pytanie "Are you sure?" "Yes!" "Ok, maybe not...")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Is family getting in the way?" "When do they not?" "Just my relationships.")))

(defrule sure-sci-fi
   ?id <- (odpowiedz "Sure!")
   ?pid <- (pytanie "Like Sci-Fi?" "Sure!" "Nope.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Present or alternate universe?" "Present." "Let's get outta here!")))

(defrule nope-sci-fi
   ?id <- (odpowiedz "Nope.")
   ?pid <- (pytanie "Like Sci-Fi?" "Sure!" "Nope.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Want to relive college?" "I'd rather not." "Take me back!")))

(defrule friends-call
   ?id <- (odpowiedz "Friends!")
   ?pid <- (pytanie "You get one lifeline. Who do you call?" "Friends!" "Bros.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Life Partners")))

(defrule bros
   ?id <- (odpowiedz "Bros.")
   ?pid <- (pytanie "You get one lifeline. Who do you call?" "Friends!" "Bros.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Someone Marry Barry")))

(defrule do-they-not
   ?id <- (odpowiedz "When do they not?")
   ?pid <- (pytanie "Is family getting in the way?" "When do they not?" "Just my relationships.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "A story of siblings?" "Yes." "Parents are crazy too!")))

(defrule just-my-relationships
   ?id <- (odpowiedz "Just my relationships.")
   ?pid <- (pytanie "Is family getting in the way?" "When do they not?" "Just my relationships.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Do they usually work out?" "Always!" "I can handle a break-up.")))

(defrule present
   ?id <- (odpowiedz "Present.")
   ?pid <- (pytanie "Present or alternate universe?" "Present." "Let's get outta here!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Is the world ending?" "Not yet!" "Might as well be.")))

(defrule lets-get-outta-here
   ?id <- (odpowiedz "Let's get outta here!")
   ?pid <- (pytanie "Present or alternate universe?" "Present." "Let's get outta here!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Fan of Christmas?" "Nah." "Sure!")))

(defrule yes-siblings
   ?id <- (odpowiedz "Yes.")
   ?pid <- (pytanie "A story of siblings?" "Yes." "Parents are crazy too!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Brother or sister?" "Brother." "Sister.")))

(defrule parents-are-crazy-too
   ?id <- (odpowiedz "Parents are crazy too!")
   ?pid <- (pytanie "A story of siblings?" "Yes." "Parents are crazy too!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Your parents?" "Oh yeah" "In-laws.")))

(defrule always
   ?id <- (odpowiedz "Always!")
   ?pid <- (pytanie "Do they usually work out?" "Always!" "I can handle a break-up.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Silver Linings Playbook")))

(defrule handle-a-break-up
   ?id <- (odpowiedz "I can handle a break-up.")
   ?pid <- (pytanie "Do they usually work out?" "Always!" "I can handle a break-up.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Someone Like You")))

(defrule nah-fan-of-christmas
   ?id <- (odpowiedz "Nah.")
   ?pid <- (pytanie "Fan of Christmas?" "Nah." "Sure!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Mr. Nobody")))

(defrule sure-fan-of-christmas
   ?id <- (odpowiedz "Sure!")
   ?pid <- (pytanie "Fan of Christmas?" "Nah." "Sure!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Holidaze")))

(defrule brother
   ?id <- (odpowiedz "Brother.")
   ?pid <- (pytanie "Brother or sister?" "Brother." "Sister.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Benny and Joon")))

(defrule sister
   ?id <- (odpowiedz "Sister.")
   ?pid <- (pytanie "Brother or sister?" "Brother." "Sister.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Someone getting married?" "No way!" "I love weddings!")))

(defrule oh-yeah
   ?id <- (odpowiedz "Oh yeah.")
   ?pid <- (pytanie "Your parents?" "Oh yeah" "In-laws.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "The Beginners")))

(defrule in-laws
   ?id <- (odpowiedz "In-laws.")
   ?pid <- (pytanie "Your parents?" "Oh yeah" "In-laws.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "While You Were Sleeping")))

(defrule not-yet
   ?id <- (odpowiedz "Not yet!")
   ?pid <- (pytanie "Is the world ending?" "Not yet!" "Might as well be.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Fan of the Duplass Brothers?" "Love them!" "Who?")))

(defrule might-as-well-be
   ?id <- (odpowiedz "Might as well be.")
   ?pid <- (pytanie "Is the world ending?" "Not yet!" "Might as well be.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Seeking a Friend for the End of the World")))

(defrule id-rather-not
   ?id <- (odpowiedz "I'd rather not.")
   ?pid <- (pytanie "Want to relive college?" "I'd rather not." "Take me back!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Fan of young love?" "I'm interested!" "Prefer older.")))

(defrule take-me-back
   ?id <- (odpowiedz "Take me back!")
   ?pid <- (pytanie "Want to relive college?" "I'd rather not." "Take me back!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Happy endings or college drama?" "Happy endings!" "Drama.")))

(defrule no-way
   ?id <- (odpowiedz "No way!")
   ?pid <- (pytanie "Someone getting married?" "No way!" "I love weddings!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Your Sister's Sister")))

(defrule love-weddings
   ?id <- (odpowiedz "I love weddings!")
   ?pid <- (pytanie "Someone getting married?" "No way!" "I love weddings!")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Save the Date")))

(defrule love-them
   ?id <- (odpowiedz "Love them!")
   ?pid <- (pytanie "Fan of the Duplass Brothers?" "Love them!" "Who?")
   =>
   (retract ?id)
   (retract ?pid)
   (assert (wynik "The One I Love")))

(defrule who
   ?id <- (odpowiedz "Who?")
   ?pid <- (pytanie "Fan of the Duplass Brothers?" "Love them!" "Who?")
   =>
   (retract ?id)
   (retract ?pid)
   (assert (wynik "In Your Eyes")))

(defrule im-interested
   ?id <- (odpowiedz "I'm interested!")
   ?pid <- (pytanie "Fan of young love?" "I'm interested!" "Prefer older.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Had a date for prom?" "Oh yeah!" "I'd rather forget.")))

(defrule prefer-older
   ?id <- (odpowiedz "Prefer older.")
   ?pid <- (pytanie "Fan of young love?" "I'm interested!" "Prefer older.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Rich or middle class?" "Show me the Benjamins." "Partial to the average Joe.")))

(defrule happy-endings
   ?id <- (odpowiedz "Happy Endings!")
   ?pid <- (pytanie "Happy endings or college drama?" "Happy endings!" "Drama.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Liberal Arts")))

(defrule drama
   ?id <- (odpowiedz "Drama.")
   ?pid <- (pytanie "Happy endings or college drama?" "Happy endings!" "Drama.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "The Graduate")))

(defrule oh-yeah-prom
   ?id <- (odpowiedz "Oh yeah!")
   ?pid <- (pytanie "Had a date for prom?" "Oh yeah!" "I'd rather forget.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Drive Me Crazy")))

(defrule rather-forget
   ?id <- (odpowiedz "I'd rather forget.")
   ?pid <- (pytanie "Had a date for prom?" "Oh yeah!" "I'd rather forget.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Had a high school sweetheart?" "High school was full of angst." "It was the best kind of love story.")))

(defrule benjamins
   ?id <- (odpowiedz "Show me the Benjamins.")
   ?pid <- (pytanie "Rich or middle class?" "Show me the Benjamins." "Partial to the average Joe.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Fan of ballroom dancing?" "I've got moves." "I have two left feet.")))

(defrule average-joe
   ?id <- (odpowiedz "Partial to the average Joe.")
   ?pid <- (pytanie "Rich or middle class?" "Show me the Benjamins." "Partial to the average Joe.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (pytanie "Hoping for love after break-up?" "Yes! We all need hope!" "Less heartache.")))

(defrule full-of-angst
   ?id <- (odpowiedz "High school was full of angst.")
   ?pid <- (pytanie "Had a high school sweetheart?" "High school was full of angst." "It was the best kind of love story.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "6 Years")))

(defrule love-story
   ?id <- (odpowiedz "It was the best kind of love story.")
   ?pid <- (pytanie "Had a high school sweetheart?" "High school was full of angst." "It was the best kind of love story.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Can't Hardly Wait")))

(defrule got-moves
   ?id <- (odpowiedz "I've got moves.")
   ?pid <- (pytanie "Fan of ballroom dancing?" "I've got moves." "I have two left feet.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "And So It Goes")))

(defrule two-left-feet
   ?id <- (odpowiedz "I have two left feet.")
   ?pid <- (pytanie "Fan of ballroom dancing?" "I've got moves." "I have two left feet.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Shall We Dance?")))

(defrule all-need-hope
   ?id <- (odpowiedz "Yes! We all need hope!")
   ?pid <- (pytanie "Hoping for love after break-up?" "Yes! We all need hope!" "Less heartache.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Crazy Kind Of Love")))

(defrule less-heartache
   ?id <- (odpowiedz "Less heartache.")
   ?pid <- (pytanie "Hoping for love after break-up?" "Yes! We all need hope!" "Less heartache.")
   =>
   (retract ?pid)
   (retract ?id)
   (assert (wynik "Elsa & Fred")))
