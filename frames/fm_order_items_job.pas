unit fm_order_items_job;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, fm_order_items, Data.DB,
  Datasnap.DBClient, uniButton, uniBitBtn, uniSpeedButton, uniBasicGrid,
  uniDBGrid, uniGUIClasses, uniEdit, uniLabel, uniGUIBaseClasses, uniPanel,
  tblOrderItem, tas_order_items_job,
  uniGUIApplication, unMessages, msg_form, Vcl.Menus, uniMainMenu, UnFunctions;

type
  TFmOrderItemsJob = class(TFmOrderItems)
    LiberarItem1: TUniMenuItem;
  private
    { Private declarations }
  protected
    function ValidateInserItems:Boolean;Override;
    procedure insertItems;Override;
    function ValidateChangeItems:Boolean;Override;
    procedure ChangeItems;Override;
    function ValidateDeleteItems:Boolean;Override;
    procedure DeleteItems;Override;

  public
    { Public declarations }
  end;

var
  FmOrderItemsJob: TFmOrderItemsJob;

implementation

{$R *.dfm}

uses MainModule;

{ TFmOrderItemsJob }

procedure TFmOrderItemsJob.ChangeItems;
Var
  Form : TTasOrderItemsJob;
Begin
  if Form = nil then
    Form := TTasOrderItemsJob.Create(UniApplication);
  Form.cds_Item := self.cds_items;
  Form.EditionState := 'E';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      Form := nil;
      self.totalizerItems;
      self.totalizer;
    end
  );
end;

procedure TFmOrderItemsJob.DeleteItems;
begin
  MensageYesNo(['C O N F I R M A Ç Ã O!',
                '',
                'Deseja realmente excluir este registro?',
                'clique em SIM para confirmar.'],mpAlerta);
  FormMsg.ShowModal(
  Procedure(Sender: TComponent; AResult:Integer)
  begin
    if (Sender as TMsgForm).BotaoEscolhido > 0 then
    Begin
      self.cds_items.Delete;
      self.totalizerItems;
      self.totalizer;
    End;
  end
  );
end;

procedure TFmOrderItemsJob.insertItems;
Var
  Form : TTasOrderItemsJob;
Begin
  if Form = nil then
  Form := TTasOrderItemsJob.Create(UniApplication);
  Form.cds_Item := self.cds_items;
  Form.EditionState := 'I';
  Form.Show(
    Procedure(Sender: TComponent; AResult:Integer)
    begin
      self.totalizerItems;
      self.totalizer;
      Form := nil;
    end
  );

end;

function TFmOrderItemsJob.ValidateChangeItems: Boolean;
begin
  Result := True;
  if cds_items.RecordCount = 0 then
  Begin
    MensageAlert(['A T E N Ç Ã O!.',
                  '',
                  'Não há registros para alterar.',
                  'Verifiqe e tente novamente.']);
    Result := False;
  End;

end;

function TFmOrderItemsJob.ValidateDeleteItems: Boolean;
begin
  Result := True;
  Inherited;
end;

function TFmOrderItemsJob.ValidateInserItems: Boolean;
begin
  Result := True;
end;

end.
