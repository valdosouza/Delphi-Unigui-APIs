unit sea_command;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_search, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Gestures, FMX.ListView, FMX.Controls.Presentation, FMX.Layouts,
  FMX.DateTimeCtrls, FMX.Edit,
  REST.Json,System.Json,ControllerCommand,
  FMX.Objects, FMX.ListBox, FMX.Effects,
  FMX.DialogService, System.ImageList, FMX.ImgList, FMX.EditBox, FMX.SpinBox,
  FMX.Ani, Network, UnFunctions, tas_command, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TSeaCommand = class(TBaseSearch)
    Rc_Dialog: TRectangle;
    Rc_proc_tittle: TRectangle;
    Lb_edit_product: TLabel;
    FA_in: TFloatAnimation;
    Ly_botao_edit_product: TLayout;
    Sb_cancel: TButton;
    Gpl_edit_product: TGridPanelLayout;
    sb_EditOrderSale: TSpeedButton;
    AniIndicator: TAniIndicator;
    Qr_Comanda: TFDQuery;
    procedure Sb_InsertClick(Sender: TObject);
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure sb_EditOrderSaleClick(Sender: TObject);
    procedure Sb_cancelClick(Sender: TObject);

  private
    { Private declarations }

    procedure ShowDialog;
    procedure HideDialog;
  protected
    procedure InitVariable;Override;
    procedure getHead;Override;
    procedure getItem(AItem: TListViewItem);override;
    procedure getList(par: String);override;
    function getSqlAddicional(palavra: TStringList;Param:String):String;
    procedure getListCommand(palavra: TStringList);
    procedure FillList;

  public
    { Public declarations }
   Command : TControllerCommand;
    CallBack : Boolean;
  end;

var
  SeaCommand: TSeaCommand;

implementation
{TSeaOrderSale}
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses openForms, MainModule, uSC;



procedure TSeaCommand.FillList;
Var
  I : Integer;
  LcLVI : TListViewItem;
begin
  //Desabilita o Botão
  Try
    lsv_Search.Items.Clear;
    lsv_Search.BeginUpdate;
    with Qr_Comanda do
    Begin
      First;
      while not eof do
      Begin
        LcLVI := lsv_Search.Items.Add;
        LcLVI.Text := Qr_Comanda.FieldByName('TB_ORDER_ID').AsString;
        LcLVI.Data['NomeCliente']     := concat('Nome :     ', Qr_Comanda.FieldByName('CONTROL_NAME').AsString);
        LcLVI.Data['NumeroComanda']   := concat('Comanda :  ', Qr_Comanda.FieldByName('CONTROL_ID').AsString);
        LcLVI.Data['NumeroTelefone']  := concat('Telefone : ', Qr_Comanda.FieldByName('CONTROL_PHONE').AsString);
        Next;
      End;
    End;
  Finally
    lsv_Search.EndUpdate;
  End;
end;

procedure TSeaCommand.getHead;
Var
  LcLVI : TListViewItem;
begin
  //Cabeçalho
  lsv_Search.Items.Clear;
  LcLVI := lsv_Search.Items.Add;
  LcLVI.Text := concat('Nome do Cliente',#13,#10,
                       'Núumero da Comanda ',#13,#10,
                       'Número do Telefone'
                );
  LcLVI.Purpose := TListItemPurpose.Header;
end;

procedure TSeaCommand.getItem(AItem: TListViewItem);
begin
  CodigoRegistro := StrToInt(AItem.Text);
  if  CodigoRegistro > 0 then
    Rc_Dialog.Visible := True;
end;

procedure TSeaCommand.getList(par: String);
begin
  getListCommand(getParameter);
  FillList;
end;


procedure TSeaCommand.getListCommand(palavra: TStringList);
Var
  LcSqlStr : String;
  I : Integer;
begin
  with Qr_Comanda do
  Begin
    Active := False;
    Connection := getConnection;
    SQL.Clear;
    SQL.Add(Concat(
              'SELECT c.DT_RECORD, TB_ORDER_ID, CONTROL_ID,CONTROL_NAME,CONTROL_PHONE ',
              'FROM TB_COMMAND c ',
              '  INNER JOIN TB_PEDIDO ',
              '  ON (PED_CODIGO = TB_ORDER_ID) ',
              'where ( ped_faturado = ''N'' ) '
    ));
    //Incrmenta o sql
    if palavra.count > 0 then
    Begin
      sql.Add(getSqlAddicional(palavra,'control_id'));
      sql.Add(getSqlAddicional(palavra,'control_name'));
      sql.Add(getSqlAddicional(palavra,'control_phone'));
    End;
    sql.Add('  order by c.DT_RECORD desc ');

    //Passagem parametros
    if palavra.count > 0 then
    Begin
      for I := 0 to palavra.count -1 do
        ParamByName(concat('palavra',i.ToString)).AsString := concat('%',palavra[I],'%');
    End;
    Active := True;
    FetchAll;
  END;


end;

function TSeaCommand.getSqlAddicional(palavra: TStringList;Param:String): String;
VAr
  I : Integer;
begin
  REsult :=  ' and ( ';
  for I := 0 to palavra.count -1 do
  Begin
    if I = 0 then
      REsult := concat(REsult,' ( ',Param,' =:',Param,' like  :palavra',i.ToString,' ) ')
    else
      REsult := concat(REsult,' and ( ',Param,' =:',Param,' like  :palavra',i.ToString,' ) ');
  End;
  REsult := concat(REsult,')');
end;

procedure TSeaCommand.HideDialog;
begin
  //Fecha a tela de edicaçõ
  Rc_Dialog.Align := TAlignLayout.None;
  Rc_Dialog.Position.y := -200;
  Rc_Dialog.Visible := False;

end;

procedure TSeaCommand.InitVariable;
begin
  Command := TControllerCommand.Create(Self);
  Rc_Dialog.Visible := FAlse;
  Rc_Dialog.Position.Y := -200;
  inherited;
end;

procedure TSeaCommand.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('NomeCliente');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('NumeroComanda');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('NumeroTelefone');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    lsv_Search.EndUpdate;
  end;
end;


procedure TSeaCommand.Sb_cancelClick(Sender: TObject);
begin
  inherited;
  HideDialog;
end;

procedure TSeaCommand.sb_EditOrderSaleClick(Sender: TObject);
Var
  Form : TTasCommand;
begin
  HideDialog;
  Form := TTasCommand.Create(nil);
  Form.CodigoRegistro := CodigoRegistro;
  Form.ShowModal(
    procedure(ModalResult : TModalResult)
    begin
      getlist('');
      Form := nil;
    end);
end;

procedure TSeaCommand.Sb_InsertClick(Sender: TObject);
Var
  Form : TTasCommand;
begin
  Form := TTasCommand.Create(nil);
  Form.CodigoRegistro := 0;
  Form.Parent := Self;
  Form.ShowModal(
      procedure(ModalResult : TModalResult)
      begin
        getlist('');
      end);
end;


procedure TSeaCommand.ShowDialog;
begin
  Rc_Dialog.Visible  := True;
end;

end.
