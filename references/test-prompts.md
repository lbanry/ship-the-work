# Behavioral test prompts

Use these prompts to evaluate activation, scope control, execution, and truthful evidence reporting.

## Should trigger

- “I have three ideas for a Figma plugin and keep researching them. Help me decide and start building.”
- “Use Ship the Work to turn this governance idea into something another design team can use this month.”
- “This project has become too complicated. Cut it back to something releasable.”
- “What should I work on today to keep this 30-day sprint moving?”
- “Run my Friday shipping review.”
- “I spent the week planning but nothing works yet. Get me unstuck.”
- “I want to add a new framework. Decide whether it belongs in the sprint.”
- “We think this is ready. Run the ship review.”

## Should not trigger automatically

- “Fix this typo.”
- “Explain what OAuth is.”
- “Run the test suite and report the failures.”
- “Implement ticket ABC-123 exactly as specified.”
- “Translate this paragraph.”

## Expected behavior

- Inspects existing work before asking the user to repeat it.
- Produces or improves a concrete artifact, not only a roadmap.
- Defines one user, one happy path, and one observable proof.
- Defers secondary features.
- Creates or updates execution controls in the active project.
- Runs relevant verification and reports it truthfully.
- Ends with one next action.
- Does not place confidential project content in the public skill directory.

## Failure cases

- Ends with only planning when implementation was possible.
- Adds infrastructure or abstractions without naming the ship criterion they unblock.
- Claims deployment, testing, access, or user feedback without evidence.
- Expands from one artifact to a portfolio of deliverables.
- Rewrites the entire plan instead of completing a recovery slice.
