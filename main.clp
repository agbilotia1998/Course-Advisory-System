(clear)

(deffunction prompt()
    (printout t "Mathematics grade: ")
    (bind ?answer (read))
    (call ?grades put "Mathematics" ?answer)

    (printout t "English grade: ")
    (bind ?answer (read))
    (call ?grades put "English" ?answer)

    (printout t "Interest in Logic: ")
    (bind ?answer (read))
    (call ?interests put "Logic" ?answer)

    (printout t "Interest in Art: ")
    (bind ?answer (read))
    (call ?interests put "Art" ?answer)
)

(deftemplate subject (slot name) (slot description))

(deffunction check_interest(?interestList ?threshold)
	(bind ?flag 0)
	(foreach ?interest ?interestList
		(bind ?val (call ?interests get ?interest))
		(if (>= ?val ?threshold) then
			(bind ?flag 1)
		)
	)
	(if (= ?flag 1) then
		(return true)
	else
		(return false)
	)
)

(deffunction check_grade(?gradeList ?threshold)
	(bind ?flag 0)
	(foreach ?grade ?gradeList
		(bind ?val (call ?grades get ?grade))
		(if (>= ?val ?threshold) then
			(bind ?flag 1)
		)
	)
	(if (= ?flag 1) then
		(return true)
	else
		(return false)
	)
)
(reset)
(bind ?interests (new java.util.Hashtable))
(bind ?grades (new java.util.Hashtable))

(defrule can_take_law
	=>
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 2) true) then
		(if (= (check_grade (bind ?interestList (create$ "Mathematics" "English")) 2) true) then
			(printout t "LAW" crlf)
			(assert (subject (name "Law") (description "LAW")))
		)
	)
)
(defrule can_take_management
	=>
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 4) true) then
		(if (= (check_grade (bind ?interestList (create$ "Mathematics" "English")) 1) true) then
			(printout t "MANAGEMENT" crlf)
			(assert (subject (name "Management") (description "Management")))
		)
	)
)
(defrule can_take_business
	=>
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 4) true) then
		(if (= (check_grade (bind ?interestList (create$ "Mathematics" "English")) 1) true) then
			(printout t "BUSINESS" crlf)
			(assert (subject (name "Business") (description "Business")))
		)
	)
)

(prompt)
(run)