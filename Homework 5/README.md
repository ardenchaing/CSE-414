# CSE 414 Homework 5: Transactions

**Objectives:**
To evaluate the properties of transaction schedules, and write transaction statements that would be used in an application.

**Assignment tools:**
- Any word processing or drawing tools you prefer (e.g., Google docs, Word, [draw.io](https://www.draw.io))


## Assignment Details

### Part 1: Schedules and Anomalies (10 points)

Consider a database with objects X, Y, and Z and assume that there are two transactions T1 and T2 that attempt the following operations.

T1: R(X), R(Y), W(X) 

T2: R(X), R(Y), W(Y), R(X), R(Y), W(X), R(Z), W(Z)

a. Write an example schedule that interleaves operations between T1 and T2, that is NOT conflict serializable.

b. If T1 is instead just “R(X)”, this corresponds to T1 just being a single query like

    SELECT * FROM Flights WHERE id=1024;
   Do we need a transaction for a single query statement like this? Why or why not?
    
Name your file **part1.pdf**

### Part 2: Conflict Serializability (20 points)

Consider the following three transactions and schedule (time goes from top to bottom). Is this schedule conflict-serializable? Show why or why not.

[Image](https://docs.google.com/document/d/163ftZblZh7F7JcITfCa6jo_0fUYtIxH2GE6lb10gswE/edit)

Name your file **part2.pdf**

### Part 3: Two-Phase Locking (20 points)

a. (Now modify the above schedule by adding locks, which may block some transactions from doing their operations until the lock is released. You’ll need to **rewrite** the above schedule in a table form. (The lecture slides show how to represent blocking in your schedules.)

Use two-phase locking in your modified schedule to ensure a conflict-serializable schedule for the transactions above. 

Use the notation L(A) to indicate that the transaction acquires the lock on element A and U(A) to indicate that the transaction releases its lock on.

b. If 2PL ensures conflict-serializability, why do we need strict 2PL? Explain briefly.

Write your answers in a text file named **part3.pdf**

## Submission Instructions

The files you will need to submit to Gradescope
- part1.pdf
- part2.pdf
- part3.pdf
