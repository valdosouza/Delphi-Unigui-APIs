unit sea_order_sale;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  base_search, FMX.ListView.Types, FMX.ListView.Appearances,zLib,
  FMX.ListView.Adapters.Base, System.Actions, FMX.ActnList, FMX.TabControl,
  FMX.Gestures, FMX.ListView, FMX.Controls.Presentation, FMX.Layouts,
  FMX.DateTimeCtrls, FMX.Edit, prm_order_sale, uDataCM, TypesListCollection,
  list_spl_order_sale,TypesCollection, REST.Json,System.Json, MainModule,
  FMX.Objects, FMX.ListBox, FMX.Effects, ctrl_mob_order_sale, tas_order_sale,
  FMX.DialogService, System.ImageList, FMX.ImgList, FMX.EditBox, FMX.SpinBox,
  FMX.Ani, Network, tblOrderSale, fm_sea_order_sale;

type
  TSeaOrderSale = class(TBaseSearch)
    Rc_Dialog: TRectangle;
    Rc_proc_tittle: TRectangle;
    Lb_edit_product: TLabel;
    FA_in: TFloatAnimation;
    Ly_botao_edit_product: TLayout;
    Sb_cancel: TButton;
    Gpl_edit_product: TGridPanelLayout;
    sb_EditOrderSale: TSpeedButton;
    Sb_SendOrderSale: TSpeedButton;
    AniIndicator: TAniIndicator;
    FmSeaOrderSale: TFmSeaOrderSale;
    procedure lsv_SearchUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure sb_EditOrderSaleClick(Sender: TObject);
    procedure Sb_cancelClick(Sender: TObject);
    procedure Sb_SendOrderSaleClick(Sender: TObject);
    procedure FmSeaOrderSalelsv_SearchDeletingItem(Sender: TObject;
      AIndex: Integer; var ACanDelete: Boolean);
    procedure FmSeaOrderSalelsv_SearchItemClick(const Sender: TObject;
      const AItem: TListViewItem);

  private
    { Private declarations }
    IndiceItemOrder : Integer;
    ListaOrderSale : TCollSplOrderSale;
    procedure ShowDialog;
    procedure HideDialog;
    procedure SendOrderSale;
    procedure deleteOrder;
  protected
    procedure InitVariable;Override;
    procedure getItem(AItem: TListViewItem);override;

    procedure SetVariable;Override;

  public
    { Public declarations }

    CallBack : Boolean;
  end;

var
  SeaOrderSale: TSeaOrderSale;

implementation
{TSeaOrderSale}
{%CLASSGROUP 'FMX.Controls.TControl'}
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses openForms,UnFunctions;



procedure TSeaOrderSale.deleteOrder;
begin
  with FmSeaOrderSale.Ordersale.Registro do
  Begin
    Estabelecimento := UMM.GInstitution.Registro.Codigo;
    Terminal  := GbTerminal;
  End;
  FmSeaOrderSale.Ordersale.deleteAll;
end;


procedure TSeaOrderSale.FmSeaOrderSalelsv_SearchDeletingItem(Sender: TObject;
  AIndex: Integer; var ACanDelete: Boolean);
begin
  IndiceItemOrder := AIndex - 1;
  deleteOrder;
  FmSeaOrderSale.getlist('');
end;

procedure TSeaOrderSale.FmSeaOrderSalelsv_SearchItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  inherited;
  getItem(AItem);
end;



procedure TSeaOrderSale.getItem(AItem: TListViewItem);
begin
  CodigoRegistro := StrToInt(AItem.Text);
  if  CodigoRegistro > 0 then
    Rc_Dialog.Visible := True;
end;



procedure TSeaOrderSale.HideDialog;
begin
  //Fecha a tela de edicaçõ
  Rc_Dialog.Align := TAlignLayout.None;
  Rc_Dialog.Position.y := -200;
  Rc_Dialog.Visible := False;

end;

procedure TSeaOrderSale.InitVariable;
begin
  TabControl.TabPosition := TTabPosition.None;
  TabControl.ActiveTab := tbs_search;
  Rc_Dialog.Visible := FAlse;
  Rc_Dialog.Position.Y := -200;
end;


procedure TSeaOrderSale.lsv_SearchUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
Var
  item: TListItemText;
begin
  inherited;
  try
    try
     FmSeaOrderSale.lsv_Search.BeginUpdate;
     item := AItem.Objects.FindObjectT<TListItemText>('Pedido');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Data');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Cliente');
     if item <> nil then
        item.Font.Size:= 12;

     item := AItem.Objects.FindObjectT<TListItemText>('Valor');
     if item <> nil then
        item.Font.Size:= 12;

    except
      on E : Exception do
            ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
    end;
  finally
    FmSeaOrderSale.lsv_Search.EndUpdate;
  end;
end;


procedure TSeaOrderSale.Sb_cancelClick(Sender: TObject);
begin
  inherited;
  HideDialog;
end;

procedure TSeaOrderSale.sb_EditOrderSaleClick(Sender: TObject);
Var
  Form : TTasOrderSale;
begin
  HideDialog;
  Form := TTasOrderSale.Create(Self);
  Form.CodigoRegistro := CodigoRegistro;
  Form.ShowModal(
    procedure(ModalResult : TModalResult)
    begin
      FmSeaOrderSale.getlist('');
      Form := nil;
    end);
end;

procedure TSeaOrderSale.SendOrderSale;
var
  LcObj : TCtrlMobOrderSale;
  LcStrJSon : String;
  LcJSon : TJsonObject;
begin
  TRy
    LcObj := TCtrlMobOrderSale.Create(Self);
    LcObj.clear;
    LcObj.Registro.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    LcObj.Registro.Codigo := CodigoRegistro;
    LcObj.Registro.Vendedor := GbSalesMan;
    LcObj.Registro.Terminal := GbTerminal;
    LcObj.getByKey;
    //Objeto Novo
    LcObj.FillDataObjeto(LcObj.Registro,LcObj.Obj);
    LcObj.Obj.Estabelecimento := UMM.GInstitution.Registro.Codigo;
    try
      LcStrJSon := TJson.ObjectToJsonString(LcObj.Obj) ;
      LcStrJSon := ZCompressString (LcStrJSon,zcDefault  );
      LcStrJSon := DataCM.SMOrderSaleClient.save(LcStrJSon);
    Except
      on E: Exception do
      Begin
        GeralogCrashlytics('TSeaOrderSale.SendOrderSale - ',e.Message);
      End;
    end;
  finally
    LcObj.DisposeOf;
  end;
end;

procedure TSeaOrderSale.SetVariable;
begin
  inherited;
  FmSeaOrderSale.InitVariable;
  FmSeaOrderSale.getList('');

end;

procedure TSeaOrderSale.ShowDialog;
begin
  Rc_Dialog.Visible  := True;
end;

procedure TSeaOrderSale.Sb_SendOrderSaleClick(Sender: TObject);
begin
  if verificaConexaoServidor then
  Begin
    Try
      Sb_cancel.Enabled := False;
      AniIndicator.BringToFront;
      AniIndicator.Visible := True;
      AniIndicator.Enabled := True;
      sb_EditOrderSale.Visible := False;
      Sb_SendOrderSale.Visible := False;
      Sb_SendOrderSale.Text := 'Enviando pedido...';
      SendOrderSale;
    Finally
      Sb_SendOrderSale.Text := 'Enviar para a Internet';
      Sb_cancelClick(Self);
      AniIndicator.SendToBack;
      AniIndicator.Visible := False;
      AniIndicator.Enabled := False;
      sb_EditOrderSale.Visible := True;
      Sb_SendOrderSale.Visible := True;
      Sb_cancel.Enabled := TRue;
    End;

  End;
end;

end.

