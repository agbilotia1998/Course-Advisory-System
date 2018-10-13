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
(deffunction check_interest(?interest ?threshold)
	(bind ?val (call ?interests get ?interest))
	(if (>= ?val ?threshold) then
		(return true)
	else
		(return false)
	)
)

(deffunction check_grade(?grade ?threshold)
	(bind ?val (call ?grades get ?grade))
	(if (>= ?val ?threshold) then
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
	(if (= (check_interest "Logic" 2) true) then
		(if (= (check_grade "English" 2) true) then
			(printout t "LAW" crlf)
			(assert (subject (name "Law") (description "LAW")))
		)
	)
)
(defrule can_take_management
	=>
	(if (= (check_interest "Art" 4) true) then
		(if (= (check_grade "Mathematics" 1) true) then
			(printout t "MANAGEMENT" crlf)
			(assert (subject (name "Management") (description "Management")))
		)
	)
)
(defrule can_take_business
	=>
	(if (= (check_interest "Art" 4) true) then
		(if (= (check_grade "English" 1) true) then
			(printout t "BUSINESS" crlf)
			(assert (subject (name "Business") (description "Business")))
		)
	)
)

(prompt)
(run)