# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

### Compare and contrast One Hot and Binary encodings

These two methods are used to convert categorical data into a numerical format, but they represent categories differently. One-hot encoding creates a new binary column for each category, where only one column is "hot(1)" for each row. Binary encoding converts categories into binary codes, creating fewer columns, which can be more beneficial for high-cardinality features.
### Which method did your team find easier, and why?
Our team found Binary encoding slightly harder, mainly because designing next-state logic required careful K-map construction and bit-level reasoning. Although Binary is more resource-efficient, the logic takes longer to implement.

We found One-Hot easier conceptually because each state corresponds directly to a single flip-flop. The transitions were simpler to follow, and debugging was more straightforward since only one bit is high at a time. However, it felt tedious because it requires many flip-flops when the state count increases.

### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.

Use One-Hot when:

You have plenty of flip-flops available (modern FPGAs have many).

Your FSM has medium to large amounts of combinational logic, and you want simpler, faster transitions.

Speed/timing closure is more important than register count.

You want clear and easy debugging.

Use Binary when:

You need to minimize flip-flop usage (e.g., many small FSMs or limited registers).

The FSM has many states, and One-Hot would use too many registers.

Combinational logic complexity is manageable with binary decoding.

You want compact hardware utilization and lower power use.
