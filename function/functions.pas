unit functions;

interface

Uses uniBasicGrid, uniStringGrid, System.AnsiStrings;

  procedure LimpaStringGrid(Grid : TUniStringGrid);
  procedure SortGridByCols(Grid: TUniStringGrid; ColOrder: array of Integer);

implementation


procedure LimpaStringGrid(Grid : TUniStringGrid);
Var
  Lc_I,Lc_J : Integer;
Begin
  For Lc_I := 1 to Grid.RowCount - 1 do
    For Lc_J := 0 to Grid.ColCount do
      Grid.Cells[Lc_J,Lc_I] := '';
  Grid.RowCount := 2;
end;

procedure SortGridByCols(Grid: TUniStringGrid; ColOrder: array of Integer);
var
  i, j: Integer;
  Sorted: Boolean;
  function Sort(Row1, Row2: Integer): Integer;
    var
    C: Integer;
  begin
    C := 0;
    Result := AnsiCompareStr(Grid.Cols[ColOrder[C]][Row1], Grid.Cols[ColOrder[C]][Row2]);
    if Result = 0 then
    begin
      Inc(C);
      while (C <= High(ColOrder)) and (Result = 0) do
      begin
        Result := AnsiCompareStr(Grid.Cols[ColOrder[C]][Row1],
        Grid.Cols[ColOrder[C]][Row2]);
        Inc(C);
      end;
    end;
  end;
begin
  if SizeOf(ColOrder) div SizeOf(i) <> Grid.ColCount then
    Exit;
  for i := 0 to High(ColOrder) do
    if (ColOrder[i] < 0) or (ColOrder[i] >= Grid.ColCount) then
      Exit;
  j := 0;
  Sorted := False;
  repeat
    Inc(j);
    with Grid do
      for i := 0 to RowCount - 2 do
        if Sort(i, i + 1) > 0 then
        begin
          TMoveSG(Grid).MoveRow(i + 1, i);
          Sorted := False;
        end;
  until Sorted or (j = 1000);
  Grid.Repaint;
end;

end.
