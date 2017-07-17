require_relative '../game'

RSpec.describe Game do
  let(:input){double("input")}
  let(:output) {double("output").as_null_object}
  let(:game){Game.new}
  let(:ask_players){game.set_number_of_players}
  let(:set_markers){game.set_player_markers}
  let(:play_order){game.set_play_order}
  let(:start_game){game.start_game}

  describe "one player game" do
    context "start game" do
      it "output welcome message on game start" do
        output.expect(:puts).with("Welcome to Tic-Tac-Toe!")
      end
    end

    context "set number of players" do
      it "rejects unpermitted selection" do
        output.expect(:puts).with("One Player or Two Player Game? (enter 1 or 2) Or Computer Death Match! (enter 0)")
        input.stub(:gets).and_return("H")
        output.expect(:puts).with("Oops, please choose 0, 1 or 2 players")
        input.stub(:gets).and_return("8")
        output.expect(:puts).with("Oops, please choose 0, 1 or 2 players")
      end
      it "accepts allowed number of players" do
        input.stub(:gets).and_return("1")
      end
    end

    context "choose marker" do
      it "rejects unpermitted player marker" do
        output.expect(:puts).with("You can be X or O or choose a different letter!")
        output.expect(:puts).with("Player 1: What marker would you like to use?")
        input.stub(:gets).and_return("9")
        output.expect(:puts).with("Oops. Please select a single letter to be your marker")
      end
      it "accepts allowed player to marker" do
        input.stub(:gets).and_return("X")
        output.expect(:puts).with("Great! Player 1 is X, Player 2 is O")
      end
    end

    context "choose play order" do
      it "rejects unpermitted answer to which player should go first" do
        output.expect(:puts).with("Who should go first? Player 1 or 2. Or make it random? (1,2,R)")
        input.stub(:gets).and_return("p")
        output.expect(:puts).with("Oops! Type 1 2 or R to select who goes first")
        input.stub(:gets).and_return("6")
        output.expect(:puts).with("Oops! Type 1 2 or R to select who goes first")
      end
      it "accepts permitted answer to which player should go first" do
        input.stub(:gets).and_return("1")
      end
    end

    context "begin game, make selections" do
      it "shows current game board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
      it "asks for first player's input" do
        output.expect(:puts).with("Its X's turn")
        output.expect(:puts).with("Enter [0-8] to select your spot")
      end
      it "rejects unpermitted spot" do
        input.stub(:gets).and_return("f")
        output.expect(:puts).with("Oops, please choose again, spot must be between 0 and 8!")
      end
      it "accepts permitted spot" do
        input.stub(:gets).and_return("1")
      end
      it "shows current board" do
        output.expect(:puts).with(" X | 1 | 2 \n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
    end

    context "computer makes selection" do
      it "declares computers turn" do
        output.expect(:puts).with("Its O's turn")
      end
      it "places computers marker" do
        output.expect(:puts).with("The computer has played O in spot # 4.")
      end
      it "shows current board" do
        output.expect(:puts).with(" X | 1 | 2 \n===+===+===\n 3 | O | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
    end
  end

  describe "two player game" do
    context "start game" do
      it "output welcome message on game start" do
        output.expect(:puts).with("Welcome to Tic-Tac-Toe!")
      end
    end

    context "set number of players" do
      it "rejects unpermitted selection" do
        output.expect(:puts).with("One Player or Two Player Game? (enter 1 or 2) Or Computer Death Match! (enter 0)")
        input.stub(:gets).and_return("L")
        output.expect(:puts).with("Oops, please choose 0, 1 or 2 players")
        input.stub(:gets).and_return("#")
        output.expect(:puts).with("Oops, please choose 0, 1 or 2 players")
      end
      it "accepts allowed number of players" do
        input.stub(:gets).and_return("2")
      end
    end

    context "choose marker" do
      it "rejects unpermitted player marker" do
        output.expect(:puts).with("You can be X or O or choose a different letter!")
        output.expect(:puts).with("Player 1: What marker would you like to use?")
        input.stub(:gets).and_return("4")
        output.expect(:puts).with("Oops. Please select a single letter to be your marker")
      end
      it "accepts Player 1 allowed player to marker" do
        input.stub(:gets).and_return("P")
      end
      it "accepts Player 2 allowed player to marker" do
        output.expect(:puts).with("Player 2: What marker would you like to use?")
        input.stub(:gets).and_return("G")
        output.expect(:puts).with("Great! Player 1 is P, Player 2 is G")
      end
    end

    context "choose play order" do
      it "rejects unpermitted answer to which player should go first" do
        output.expect(:puts).with("Who should go first? Player 1 or 2. Or make it random? (1,2,R)")
        input.stub(:gets).and_return("p")
        output.expect(:puts).with("Oops! Type 1 2 or R to select who goes first")
        input.stub(:gets).and_return("6")
        output.expect(:puts).with("Oops! Type 1 2 or R to select who goes first")
      end
      it "accepts permitted answer to which player should go first" do
        input.stub(:gets).and_return("2")
      end
    end

    context "begin game, Player 2 makes selections" do
      it "shows current game board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
      it "asks for first player's input" do
        output.expect(:puts).with("Its G's turn")
        output.expect(:puts).with("Enter [0-8] to select your spot")
      end
      it "rejects unpermitted spot" do
        input.stub(:gets).and_return("f")
        output.expect(:puts).with("Oops, please choose again, spot must be between 0 and 8!")
      end
      it "accepts permitted spot" do
        input.stub(:gets).and_return("8")
      end
      it "shows current board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | G \n")
      end
    end

    context "Player 1 makes selections" do
      it "shows current game board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | G \n")
      end
      it "asks for first player's input" do
        output.expect(:puts).with("Its P's turn")
        output.expect(:puts).with("Enter [0-8] to select your spot")
      end
      it "rejects unpermitted spot" do
        input.stub(:gets).and_return("m")
        output.expect(:puts).with("Oops, please choose again, spot must be between 0 and 8!")
      end
      it "accepts permitted spot" do
        input.stub(:gets).and_return("4")
      end
      it "shows current board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | P | 5\n===+===+===\n 6 | 7 | G \n")
      end
    end

  end

  describe "computer death match" do
    context "start game" do
      it "output welcome message on game start" do
        output.expect(:puts).with("Welcome to Tic-Tac-Toe!")
      end
    end

    context "set number of players" do
      it "rejects unpermitted selection" do
        output.expect(:puts).with("One Player or Two Player Game? (enter 1 or 2) Or Computer Death Match! (enter 0)")
        input.stub(:gets).and_return("t")
        output.expect(:puts).with("Oops, please choose 0, 1 or 2 players")
        input.stub(:gets).and_return(" ")
        output.expect(:puts).with("Oops, please choose 0, 1 or 2 players")
      end
      it "accepts allowed number of players" do
        input.stub(:gets).and_return("0")
      end
    end

    context "chooses marker for computer players" do
      it "shows computer markers" do
        output.expect(:puts).with("Great! Player 1 is X, Player 2 is O")
      end
    end

    context "choose play order" do
      it "rejects unpermitted answer to which player should go first" do
        output.expect(:puts).with("Who should go first? Player 1 or 2. Or make it random? (1,2,R)")
        input.stub(:gets).and_return("p")
        output.expect(:puts).with("Oops! Type 1 2 or R to select who goes first")
        input.stub(:gets).and_return("6")
        output.expect(:puts).with("Oops! Type 1 2 or R to select who goes first")
      end
      it "accepts permitted answer to which player should go first" do
        input.stub(:gets).and_return("1")
      end
    end

    context "begin game, Player 1 makes selections" do
      it "shows current game board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | 4 | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
      it "shows computer Player 1 goes first" do
        output.expect(:puts).with("Its X's turn")
      end
      it "shows current board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | X | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
    end

    context "computer Player 2 makes selections" do
      it "shows current game board" do
        output.expect(:puts).with(" 0 | 1 | 2 \n===+===+===\n 3 | X | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
      it "shows computer Player 1 goes first" do
        output.expect(:puts).with("Its O's turn")
      end
      it "shows current board" do
        output.expect(:puts).with(" 0 | 1 | O \n===+===+===\n 3 | X | 5\n===+===+===\n 6 | 7 | 8 \n")
      end
    end

    context "begin game, Player 1 makes selections" do
      it "shows computer Player 1 goes first" do
        output.expect(:puts).with("Its X's turn")
      end
      it "shows current board" do
        output.expect(:puts).with(" 0 | 1 | O \n===+===+===\n 3 | X | 5\n===+===+===\n 6 | X | 8 \n")
      end
    end

    context "computer Player 2 makes selections" do
      it "shows computer Player 1 goes first" do
        output.expect(:puts).with("Its O's turn")
      end
      it "shows current board" do
        output.expect(:puts).with(" 0 | O | O \n===+===+===\n 3 | X | 5\n===+===+===\n 6 | X | 8 \n")
      end
    end
  end

  describe "knows when game is over" do
    context "evaluates win" do
      it "returns true to winning board" do
        expect(game.game_is_over(["X", "X", "X", "3", "O", "5", "6", "7", "O"])).to be(true)
      end
      it "returns false to losing board" do
        expect(game.game_is_over(["X", "O", "X", "3", "O", "5", "6", "7", "O"])).to be(false)
      end
    end
  end
end
