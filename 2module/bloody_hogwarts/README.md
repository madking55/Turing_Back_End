# Bloody Hogwarts

This Rails application is intended to be used as an opportunity for students to measure their own learning from week 2 of module 2 of the back-end program of the Turing School of Software & Design.

Fork this repository and clone your newly created repository.

## Be sure to read all user stories BEFORE beginning your work
---

## Setup

* Fork this repository
* Clone down your forked repository
* Perform the usual setup steps after cloning a Rails application:
  - `bundle install`
  - `bundle update`
  - `rake db:{drop,create,migrate,seed}`
---

### Requirements

* TDD all new work; any model METHODS you write must be fully tested.
---
### Not Required

* No form input is required or expected
* No visual stylins is required or expected
---
### Before Starting User Stories

* This challenge uses a many-to-many table (your migrations are already built!), be sure to check your setup/schema carefully.
* You will have 10 failing model tests (Let your instructor know if you are not seeing 10 failing tests)
* Get these 10 tests to pass before moving on to the user stories below.

---

## User Stories

```
[X] User Story 1 of 4

As a visitor,
When I visit '/students',
I see a list of students with the following information:
-Name
-Age
-House
(e.g. "Name: Casseopia Black, Age: 14, House: Slytherin")
```

```
[X] User Story 2 of 4

As a visitor,
When I visit '/students/:id'
I see a list of the students' courses.

(e.g. "Defense against the Dark Arts"
      "Herbology"
      "Potions")
```

```
[X] User Story 3 of 4
As a visitor,
When I visit '/courses'
I see a list of courses and the number of students enrolled in each course.

(e.g. "Defense Against the Dark Arts: 5"
      "Herbology: 10")
```

```
[X] User Story 4 of 4

As a visitor,
When I visit '/students'
I see the average age of all students.

(e.g. "Average Age: 14.5")
```
---
### Extension
```
[X] User Story Extension

Students index page shows students in alphabetical order.
Courses index page shows courses in alphabetical order.
And the courses index page also shows students per course in alphabetical order.

(e.g. "Defense Against the Dark Arts: 3"
      "- Elizabeth Burke"  
      "- Phineas Black"
      "- Russell Lucky"
      )
```
