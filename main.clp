(clear)

(deffunction prompt()
    (printout t "Mathematics grade: ")
    (bind ?answer (read))
    (call ?grades put "Mathematics" ?answer)

    (printout t "English grade: ")
    (bind ?answer (read))
    (call ?grades put "English" ?answer)

    (printout t "Physics grade: ")
    (bind ?answer (read))
    (call ?grades put "Physics" ?answer)

    (printout t "Chemistry grade: ")
    (bind ?answer (read))
    (call ?grades put "Chemistry" ?answer)

    (printout t "Geography grade: ")
    (bind ?answer (read))
    (call ?grades put "Geography" ?answer)

    (printout t "History grade: ")
    (bind ?answer (read))
    (call ?grades put "History" ?answer)

    (printout t "Biology grade: ")
    (bind ?answer (read))
    (call ?grades put "Biology" ?answer)

    (printout t "Civics grade: ")
    (bind ?answer (read))
    (call ?grades put "Civics" ?answer)
	
	(printout t "PEd grade: ")
    (bind ?answer (read))
    (call ?grades put "PEd" ?answer)   

    (printout t "Hindi grade: ")
    (bind ?answer (read))
    (call ?grades put "Hindi" ?answer)   

    (printout t "Homescience grade: ")
    (bind ?answer (read))
    (call ?grades put "Homescience" ?answer)

    

    (printout t "Interest in Logic: ")
    (bind ?answer (read))
    (call ?interests put "Logic" ?answer)

    (printout t "Interest in Management: ")
    (bind ?answer (read))
    (call ?interests put "Management" ?answer)

    (printout t "Interest in Medicine: ")
    (bind ?answer (read))
    (call ?interests put "Medicine" ?answer)

    (printout t "Interest in Architecture: ")
    (bind ?answer (read))
    (call ?interests put "Architecture" ?answer)

    (printout t "Interest in History: ")
    (bind ?answer (read))
    (call ?interests put "History" ?answer)

    (printout t "Interest in Catering: ")
    (bind ?answer (read))
    (call ?interests put "Catering" ?answer)

    (printout t "Interest in Inventions: ")
    (bind ?answer (read))
    (call ?interests put "Inventions" ?answer)

    (printout t "Interest in Sports: ")
    (bind ?answer (read))
    (call ?interests put "Sports" ?answer)

    (printout t "Interest in Politics: ")
    (bind ?answer (read))
    (call ?interests put "Politics" ?answer)

    (printout t "Interest in Art: ")
    (bind ?answer (read))
    (call ?interests put "Art" ?answer)

    (printout t "Interest in Science: ")
    (bind ?answer (read))
    (call ?interests put "Science" ?answer)

    (printout t "Interest in Farming: ")
    (bind ?answer (read))
    (call ?interests put "Farming" ?answer)

	(printout t "Interest in Media: ")
    (bind ?answer (read))
    (call ?interests put "Media" ?answer)    
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
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art" "Politics")) 4) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English" "Hindi")) 4) true) then
			(printout t "LAW" crlf)
			(assert (subject (name "Law") (description "LAW")))
		)
	)
)
(defrule can_take_management
	=>
	(if (= (check_interest (bind ?interestList (create$ "Management")) 5) true) then
		(if (= (check_interest (bind ?interestwList (create$ "Logic" "Art")) 4) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(printout t "MANAGEMENT" crlf)
				(assert (subject (name "Management") (description "Management")))
			)
		)
	)
)
(defrule can_take_business
	=>
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 4) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 1) true) then
			(printout t "BUSINESS" crlf)
			(assert (subject (name "Business") (description "Business")))
		)
	)
)
(defrule can_take_catering_and_hotel_management
	=>
	(if (= (check_interest (bind ?interestList (create$ "Management" "Catering")) 5) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 4) true) then
			(if (= (check_grade (bind ?gradewList (create$ "Homescience")) 5) true) then	
				(printout t "CATERING AND HOTEL MANAGEMENT" crlf)
				(assert (subject (name "Catering and Hotel Management") (description "Catering and Hotel Management")))
			)	
		)
	)
)
(defrule can_take_microbiology
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science")) 5) true) then
		(if (= (check_interest (bind ?interestwList (create$ "Logic" "Art")) 4) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(if (= (check_grade (bind ?gradewList (create$ "Biology" "Chemistry")) 7) true) then	
					(printout t "MICROBIOLOGY" crlf)
					(assert (subject (name "Microbiology") (description "Microbiology")))
				)
			)
		)
	)
)
(defrule can_take_agriculture
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science" "Farming")) 5) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Hindi" "Biology")) 4) true) then
			(printout t "AGRICULTURE" crlf)
			(assert (subject (name "Agriculture") (description "Agriculture")))
		)
	)
	
)
(defrule can_take_mechanical_engineering
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science" "Architecture")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(if (= (check_grade (bind ?gradewList (create$ "Physics")) 7) true) then
					(printout t "MECHANICAL ENGINEERING" crlf)
					(assert (subject (name "Mechanical Engineering") (description "Mechanical Engineering")))
				)
			)
		
	)
)
(defrule can_take_fashion_design
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 6) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(printout t "FASHION DESIGN" crlf)
				(assert (subject (name "Fashion Design") (description "Fashion Design")))
			)
		)
)
(defrule can_take_commerce
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Politics" "History")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 1) true) then
				(printout t "COMMERCE" crlf)
				(assert (subject (name "Commerce") (description "Commerce")))
			)
		)
)
(defrule can_take_journalism
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Politics" "History" "Media")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English" "Hindi")) 1) true) then
				(if (= (check_grade (bind ?gradewList (create$ "Civics" "History" "Geography")) 4) true) then
					(printout t "JOURNALISM" crlf)
					(assert (subject (name "Journalism") (description "Journalism")))
				)			
			)
		)
)
(defrule can_take_mass_communication
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Politics" "Media")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Mathematics" "Hindi")) 1) true) then
				(printout t "MASS COMMUNICATION" crlf)
				(assert (subject (name "Mass Communication") (description "Mass Communication")))
			)
		)
)
(defrule can_take_geology
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Inventions")) 7) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Physics" "Geography")) 4) true) then
				(printout t "GEOLOGY" crlf)
				(assert (subject (name "Geology") (description "Geology")))
			)
		)
)
(defrule can_take_marine_engineering
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Inventions")) 6) true) then
			(if (= (check_grade (bind ?gradeList (create$  "Mathematics" "Physics" "Geography")) 2) true) then
				(printout t "MARINE ENGINEERING" crlf)
				(assert (subject (name "Marine Engineering") (description "Marine Engineering")))
			)
		)
)
(defrule can_take_architechture
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Architecture")) 7) true) then
			(if (= (check_grade (bind ?gradeList (create$  "Mathematics" "Physics" "Homescience")) 3) true) then
				(printout t "ARCHITECHTURE" crlf)
				(assert (subject (name "Architechture") (description "Architechture")))
			)
		)
)
(defrule can_take_computer_science
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Media")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$  "Mathematics" "English" "History")) 3) true) then
				(printout t "COMPUTER SCIENCE" crlf)
				(assert (subject (name "Computer Science") (description "Computer Science")))
			)
		)
)
(defrule can_take_economics
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Media" "History")) 6) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Civics" "Homescience")) 3) true) then
				(printout t "ECONOMICS" crlf)
				(assert (subject (name "Economics") (description "Economics")))
			)
		)
)
(defrule can_take_statistics
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science")) 5) true) then
		(if (= (check_interest (bind ?interestwList (create$ "Logic" "Art")) 4) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics")) 5) true) then
				(if (= (check_grade (bind ?gradewList (create$ "English")) 3) true) then	
					(printout t "STATISTICS" crlf)
					(assert (subject (name "Statistics") (description "Statistics")))
				)
			)
		)
	)
)
(defrule can_take_pharmacy
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science")) 5) true) then
		(if (= (check_interest (bind ?interestwList (create$ "Logic" "Medicine")) 4) true) then
			(if (= (check_grade (bind ?gradeList (create$ "English")) 2) true) then
				(if (= (check_grade (bind ?gradewList (create$ "Biology" "Chemistry")) 7) true) then	
					(printout t "PHARMACY" crlf)
					(assert (subject (name "Pharmacy") (description "Pharmacy")))
				)
			)
		)
	)
)
(defrule can_take_mathematics
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science")) 8) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Mathematics")) 5) true) then
				(printout t "MATHEMATICS" crlf)
				(assert (subject (name "Mathematics") (description "Mathematics")))
			)
		)
)
(defrule can_take_physical_education_and_sports
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Sports" "Science")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "PEd" "Homescience")) 3) true) then
				(printout t "PHYSICAL EDUCATION AND SPORTS" crlf)
				(assert (subject (name "Physical Educaion and Sports") (description "Physical Educaion and Sports")))
			)
		)
)
(prompt)
(run)