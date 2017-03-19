module Game exposing(Position, GameState, isValidMove)

type alias Position =
  { row : Int
  , column : Int
  }

type alias GameState =
  { attackers : List Position
  , defenders : List Position
  , king : Position
  , pieceSelected : Maybe Position
  , boardSize : Int
  }

isValidMove : GameState -> Position -> Bool
isValidMove model toPosition =
  case model.pieceSelected of
    Just pieceSelected ->
      let
        inSameRowOrColumn = pieceSelected.row == toPosition.row || pieceSelected.column == toPosition.column
        stillOnBoard = toPosition.row >= 0 && toPosition.row <= model.boardSize
          && toPosition.column >= 0 && toPosition.column <= model.boardSize
      in inSameRowOrColumn && stillOnBoard
    Nothing ->
      False