(clear)

(deffunction prompt()
	;Takes user input for grades in different subjects 

	(printout t "Enter Grades on a scale of 1-10" crlf)
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

    
	; Takes user input for interest levels in different fields
	(printout t "Enter Interest Levels on a scale of 1-10" crlf)
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

; defines how the system stores facts in runtime
(deftemplate subject (slot name) (slot description))

; function to check if interest level is above threshold
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

; function to check if grade value is above threshold
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

;creates two hash tables to store user input
(bind ?interests (new java.util.Hashtable))
(bind ?grades (new java.util.Hashtable))

;rules to check if any course is suitable considering the interest and grade level  
(defrule can_take_law
	=>
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art" "Politics")) 4) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English" "Hindi")) 4) true) then
			(assert (subject (name "Law") (description "Deals with writing legal documents, offerring legal advice and representstion to 
     people or companies")))
		)
	)
)
(defrule can_take_management
	=>
	(if (= (check_interest (bind ?interestList (create$ "Management")) 5) true) then
		(if (= (check_interest (bind ?interestwList (create$ "Logic" "Art")) 4) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(assert (subject (name "Management") (description "Deals with Management")))
			)
		)
	)
)
(defrule can_take_business
	=>
	(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 4) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 1) true) then
			(assert (subject (name "Business") (description "Deals with Business")))
		)
	)
)
(defrule can_take_catering_and_hotel_management
	=>
	(if (= (check_interest (bind ?interestList (create$ "Management" "Catering")) 5) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 4) true) then
			(if (= (check_grade (bind ?gradewList (create$ "Homescience")) 5) true) then	
				(assert (subject (name "Catering and Hotel Management") (description "Deals with the activities of providing food and drink for a number of people  and managing a hotel.")))
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
					(assert (subject (name "Microbiology") (description "Deals with the study of small living things such as bacteria and their
      effects on people.")))
				)
			)
		)
	)
)
(defrule can_take_agriculture
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science" "Farming")) 5) true) then
		(if (= (check_grade (bind ?gradeList (create$ "Hindi" "Biology")) 4) true) then
			(assert (subject (name "Agriculture") (description "Study of farming and animals")))
		)
	)
	
)
(defrule can_take_mechanical_engineering
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science" "Architecture")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(if (= (check_grade (bind ?gradewList (create$ "Physics")) 7) true) then
					(assert (subject (name "Mechanical Engineering") (description "It is engineering concerned primarily with the industrial application of mechanics and with the
	  production of tools, machinery, and their products")))
				)
			)
		
	)
)
(defrule can_take_fashion_design
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Art")) 6) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 2) true) then
				(assert (subject (name "Fashion Design") (description "Deals with clothings and fashion design")))
			)
		)
)
(defrule can_take_commerce
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Politics" "History")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English")) 1) true) then
				(assert (subject (name "Commerce") (description "Deals with activities and procedures involved in buying and selling things.")))
			)
		)
)
(defrule can_take_journalism
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Politics" "History" "Media")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics" "English" "Hindi")) 1) true) then
				(if (= (check_grade (bind ?gradewList (create$ "Civics" "History" "Geography")) 4) true) then
					(assert (subject (name "Journalism") (description "Deals with the study of collecting news and writing about it for newspapers, magazines, television, or radio.")))
				)			
			)
		)
)
(defrule can_take_mass_communication
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Politics" "Media")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Mathematics" "Hindi")) 1) true) then
				(assert (subject (name "Mass Communication") (description "Deals with the study of communication")))
			)
		)
)
(defrule can_take_geology
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Inventions")) 7) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Physics" "Geography")) 4) true) then
				(assert (subject (name "Geology") (description "Deals with the study of the Earth's structure, surface, and origins.")))
			)
		)
)
(defrule can_take_marine_engineering
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Inventions")) 6) true) then
			(if (= (check_grade (bind ?gradeList (create$  "Mathematics" "Physics" "Geography")) 2) true) then
				(assert (subject (name "Marine Engineering") (description "Study of marine life and science.")))
			)
		)
)
(defrule can_take_architechture
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Architecture")) 7) true) then
			(if (= (check_grade (bind ?gradeList (create$  "Mathematics" "Physics" "Homescience")) 3) true) then
				(assert (subject (name "Architechture") (description "Deals with the art and practice of planning and designing buildings:")))
			)
		)
)
(defrule can_take_computer_science
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science" "Media")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$  "Mathematics" "English" "History")) 3) true) then
				(assert (subject (name "Computer Science") (description "Study of computers, their design and their uses for various tasks, 
	including design and development of computer hardware and software.")))
			)
		)
)
(defrule can_take_economics
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Media" "History")) 6) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Civics" "Homescience")) 3) true) then
				(assert (subject (name "Economics") (description "Study of the way in which money, industry, and trade are organized in a society.")))
			)
		)
)
(defrule can_take_statistics
	=>
	(if (= (check_interest (bind ?interestList (create$ "Science")) 5) true) then
		(if (= (check_interest (bind ?interestwList (create$ "Logic" "Art")) 4) true) then
			(if (= (check_grade (bind ?gradeList (create$ "Mathematics")) 5) true) then
				(if (= (check_grade (bind ?gradewList (create$ "English")) 3) true) then
					(assert (subject (name "Statistics") (description "Deals with the collection, analysis, interpretation, and presentation of masses of numerical data")))
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
					(assert (subject (name "Pharmacy") (description "Deals with the science of preparing medicines.")))
				)
			)
		)
	)
)
(defrule can_take_mathematics
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Science")) 8) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "Mathematics")) 5) true) then
				(assert (subject (name "Mathematics") (description "Study of mathematics and one can also teach in this field")))
			)
		)
)
(defrule can_take_physical_education_and_sports
	=>
		(if (= (check_interest (bind ?interestList (create$ "Logic" "Sports" "Science")) 5) true) then
			(if (= (check_grade (bind ?gradeList (create$  "English" "PEd" "Homescience")) 3) true) then
				(assert (subject (name "Physical Educaion and Sports") (description "Study of the science behind physical exercises.")))
			)
		)
)
(prompt)
(run)
(facts)