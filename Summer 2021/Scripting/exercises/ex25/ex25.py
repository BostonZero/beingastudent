#1' /usr/bin/python3
import random

GOOD_VALUES = [1,2,3]
USER_MARK = 'X'
MACHINE_MARK = 'O'
board =[[' ',' ',' '],[' ',' ',' '],[' ',' ',' ']]
prev_moves = []

random. seed(10)

# prints a row of the board
def print_row(row):
    print(row[0] + '|' + row[1] + '|' + row[2])

# prints the game board
def print_board():
    print_row(board[0])
    print('-----')
    print_row(board[1])
    print('-----')
    print_row(board[2])

# gets the row and column of the next user move
# indexing starts at 1 for both rows and columns
def user_move():
    while True:
        reply = input('Your move (row col): ')
        print()
        fields = reply.split()
        if len(fields) < 2:
            print('Need a row number and a column number')
            continue
        row, col = fields
        try:
            row = int(row)
            col = int(col)
        except:
            print(row, 'or', col, 'is not a number')
            continue
        if row not in GOOD_VALUES or col not in GOOD_VALUES:
            print('Row and column values must be 1, 2, or 3')
            continue
        if (row, col) in prev_moves:
            print(row, col, 'is already taken')
            continue
        else:
            prev_moves.append((row, col))
            return row, col

# calculates the machine move
def machine_nove():
    print('Opponent moves')
    print()
    while True:
        row = random.randint(1,3)
        col = random. randint(1,3)
        if (row, col) not in prev_moves:
            prev_moves.append((row, col))
            return row, col
        else:
            continue


# places a mark in a particular cell on the board
def mark_square(row, col, mark):
    board[row - 1][col - 1] = mark

# returns true if the contents of a cell is not empty and matches the mark
def cell_match(row, col, mark):
    return board[row][col] == mark

# prints o message and returns true if one side wins
def game_over(mark):
    # check rows
    for row in [0,1,2]:
        for col in [0,1,2]:
            if not cell_match(row, col, mark):
                break
            if cell_match(row, 0, mark) and cell_match(row, 1, mark) \
                and cell_match(row, 2, mark):
                print('\n' + mark , 'wins!')
                return True

    # check columns
    for col in [0,1,2]:
        for row in [0,1,2]:
            cell_mark = board[row][col]
            if not cell_match(row, col, mark):
                break
            if cell_match(0, col, mark) and cell_match(1, col, mark) \
                and cell_match(2, col, mark):
                print('\n' + mark , 'wins!')
                return True
        
    # check diagonals
    if cell_match(0, 0, mark) and cell_match(1, 1, mark) and cell_match(2, 2, mark):
        print('\n' + mark , 'wins!')
        return True
    if cell_match(0, 2, mark) and cell_match(1, 1, mark) and cell_match(2, 0, mark):
        print('\n' + mark , 'wins1')
        return True
    return False

print_board()
print()
while True:
    row, col = user_move()
    mark_square(row, col, USER_MARK)
    print_board()
    if game_over (USER_MARK):
        break
    print()
    row, col = machine_nove()
    mark_square(row, col, MACHINE_MARK)
    print_board()
    if game_over(MACHINE_MARK):
        break
    print()
