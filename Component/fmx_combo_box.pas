unit fmx_combo_box;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Controls, FMX.ListBox,Winapi.Messages;

type
  TFmxComboBox = class(TComboBox)
  private
    FStoredItems: TStringList;
    dofilter:boolean;
    storeditemindex:integer;
    procedure FilterItems;
    procedure StoredItemsChange(Sender: TObject);
    procedure SetStoredItems(const Value: TStringList);
    procedure CNCommand(var AMessage: TWMCommand); //message CN_COMMAND;
  protected
    procedure KeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);override;
    procedure CloseUp; override;
    procedure Click; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property StoredItems: TStringList read FStoredItems write SetStoredItems;
    procedure InitSmartCombo;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('WebSetes', [TFmxComboBox]);
end;

{ TFmxComboBox }

procedure TFmxComboBox.Click;
begin
  if dofilter then begin
        if storeditemindex<>-1 then itemindex:=storeditemindex;
        storeditemindex:=-1;
      end;
      inherited;
end;

procedure TFmxComboBox.CloseUp;
begin
      if dofilter then begin
        if (items.count=1) and (itemindex=0) then text:=items[itemindex]
        else if ((text<>'') and (itemindex<>-1) and (text<>items[itemindex])) or ((text='') and(itemindex=0)) then begin
          storeditemindex:=itemindex;
          x:=text;
          itemindex:=items.indexof(text);
          if itemindex=-1 then text:=x;
        end
        else storeditemindex:=-1;
      end;
      inherited;

end;

procedure TFmxComboBox.CNCommand(var AMessage: TWMCommand);
begin
  // we have to process everything from our ancestor
  inherited;
  // if we received the CBN_EDITUPDATE notification
  if (AMessage.NotifyCode = CBN_EDITUPDATE) and dofilter then
  begin
    // fill the items with the matches
    FilterItems;
  end;
end;

constructor TFmxComboBox.Create(AOwner: TComponent);
begin
  inherited;
  FStoredItems := TStringList.Create;
  dofilter:=false;
end;

destructor TFmxComboBox.Destroy;
begin
  FStoredItems.Free;
  inherited;
end;

procedure TFmxComboBox.FilterItems;
var
  I: Integer;
  Selection: TSelection;
begin
  // store the current combo edit selection
  SendMessage(Handle, CB_GETEDITSEL, WPARAM(@Selection.StartPos), LPARAM(@Selection.EndPos));

  // begin with the items update
  Items.BeginUpdate;
  try
    // if the combo edit is not empty, then clear the items
    // and search through the FStoredItems
    if Text <> '' then
    begin
      // clear all items
      Items.Clear;
      // iterate through all of them
      for I := 0 to FStoredItems.Count - 1 do
      begin
        // check if the current one contains the text in edit, case insensitive
        if (Pos( uppercase(Text), uppercase(FStoredItems[I]) )>0) then
        begin
          // and if so, then add it to the items
          Items.Add(FStoredItems[I]);
        end;
      end;
    end
    else
    begin
      // else the combo edit is empty
      // so then we'll use all what we have in the FStoredItems
      Items.Assign(FStoredItems);
    end;
  finally
    // finish the items update
    Items.EndUpdate;
  end;
  // and restore the last combo edit selection

//  SendMessage(Handle, CB_SETEDITSEL, 0, MakeLParam(Selection.StartPos, Selection.EndPos));
end;

procedure TFmxComboBox.InitSmartCombo;
begin
      FStoredItems.OnChange:=nil;
      StoredItems.Assign(Items);
      AutoComplete := False;
      FStoredItems.OnChange := StoredItemsChange;
      dofilter:=true;
      storeditemindex:=-1;

end;

procedure TFmxComboBox.KeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin

      inherited;
      if dofilter and not (ord(key) in [13,27]) then begin
        if (items.Count<>0) and not droppeddown then SendMessage(Handle, CB_SHOWDROPDOWN, 1, 0)   // something matched -> dropdown combo to display results
      end;
end;

procedure TFmxComboBox.SetStoredItems(const Value: TStringList);
begin
      if Assigned(FStoredItems) then
        FStoredItems.Assign(Value)
      else
        FStoredItems := Value;

end;

procedure TFmxComboBox.StoredItemsChange(Sender: TObject);
begin
      if Assigned(FStoredItems) then
      FilterItems;

end;

end.
