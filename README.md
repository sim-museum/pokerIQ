# pokerIQ

A Texas Hold'em trainer for Linux: you play a six-handed table against computer opponents, each with its own
style, and the program shows the numbers behind every decision.

## Features

- **Opponents with characters**: tight, loose, station, aggressive, optimal, shark, exploitative, theory-of-mind
  and ICM players, plus an external poker engine seat.
- **Show Tells**: each opponent's timing and betting tells, and the pot odds every player faces.
- **Theory of Mind**: estimated ranges for every opponent (169-hand grids), your equity against those ranges,
  outs, board texture and an advisor.
- **Odds & Sizing**: your equity against each style's fold / call / raise lines, the bet sizes in chips with the
  point where a bet commits your stack, and how each opponent is built.
- **God Mode**: everyone's cards, and what each player believes its equity is against the truth.
- **Hand summary** after each hand, and network play with other people.
- **Browser version**: open `pokerIQ.html` in a web browser.

## Requirements

- Ubuntu 24.04 or later (or a compatible Linux)
- Python 3.10 or later, with `python3-venv` and the tools to build eval7 (`sudo apt install python3-venv
  python3-dev build-essential`)

## Install and run

```bash
git clone <this repository> pokerIQ
cd pokerIQ
./run.sh
```

The first run creates a Python virtual environment (`venv/`) and installs PyQt6, eval7 and PyPokerEngine into it
(`requirements.txt`).

Options:

```bash
./run.sh --god             # God Mode on from the start
./run.sh --tells           # Show Tells on from the start
./run.sh --textmode        # play in the terminal, no window
./run.sh --replay LOGFILE  # replay a saved session log
```
