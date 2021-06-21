unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  uniDateTimePicker, uniCheckBox, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  uniBasicGrid, uniDBGrid, uniButton, uniBitBtn, uniSpeedButton;

type
  TMainForm = class(TUniForm)
    pnl_top: TUniPanel;
    pnl_data: TUniPanel;
    chbx_periodo: TUniCheckBox;
    pnl_data_campos: TUniPanel;
    DTP_Date_Initial: TUniDateTimePicker;
    DTP_Date_End: TUniDateTimePicker;
    pnl_body: TUniPanel;
    dbg_Search: TUniDBGrid;
    DSP: TDataSetProvider;
    cds_search: TClientDataSet;
    ds_search: TDataSource;
    Sb_Search: TUniSpeedButton;
    pnl_button: TUniPanel;
    cds_searchtb_project_id: TIntegerField;
    cds_searchid: TIntegerField;
    cds_searchdt_record: TDateField;
    cds_searchdesc_interface: TStringField;
    cds_searchnote: TStringField;
    procedure Sb_SearchClick(Sender: TObject);
    procedure cds_searchnoteChange(Sender: TField);
    procedure UniFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure Search;
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UMM.GetFormInstance(TMainForm));
end;

{ TMainForm }

procedure TMainForm.cds_searchnoteChange(Sender: TField);
begin
  Text := Sender.AsString
end;

procedure TMainForm.Sb_SearchClick(Sender: TObject);
begin
  try
    Self.showMask('Aguarde Processamento');
    UniSession.Synchronize();
    Search;
  finally
    self.HideMask;
  end;
end;

procedure TMainForm.Search;
Begin
  Try
    cds_search.Active := False;
    with UMM.Qr_Crud do
    Begin
      Active := False;
      sql.Clear;
      SQL.Add(concat(
              'Select  ',
              'tb_project_id,  ',
              'id,  ',
              'dt_record,  ',
              'desc_interface,  ',
              'note ',
              'from tb_proj_log_changes  ',
              'where (tb_project_id =44) '
      ));
      if chbx_periodo.Checked then
      Begin
        sql.Add(' and (dt_record between :dataini and :datafim) ');
      End;
      sql.Add(' Order by dt_record desc ');

      if chbx_periodo.Checked then
      Begin
        ParamByName('dataini').AsDateTime := DTP_Date_Initial.DateTime;
        ParamByName('datafim').AsDateTime := DTP_Date_End.DateTime;
      End;
      Prepare;
      Active := True;
      FetchAll;
    End;
  Finally
    cds_search.Active := True;
    Umm.Qr_Crud.close;
  End;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);
begin
  DTP_Date_Initial.DateTime := Date;
  DTP_Date_End.DateTime := Date;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
