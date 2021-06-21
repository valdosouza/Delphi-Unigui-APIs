unit base_report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,Printers,
  QRPDFFilt, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, ControllerInstitution;

type
  TBaseReport = class(TForm)
    Qrpt: TQuickRep;
    QrpPDF: TQRPDFFilter;
    Qry: TFDQuery;
    cbxPrinters: TComboBox;
    procedure FormCreate(Sender: TObject);
    //Preparação do Relatorio
  private

    { Private declarations }
  protected
    //Operações com Sql

    SelectTxt : String;
    FromTxt : String;
    InnerJoinTxt : String;
    WhereTxt : String;

    UnionSelectTxt : String;
    UnionFromTxt : String;
    UnionInnerJoinTxt : String;
    UnionWhereTxt : String;

    OrderByTxt : String;
    GroupByTxt : String;
    //Operações com Sql
    procedure SelectSql;Virtual;
    procedure FromSql;Virtual;
    procedure InnerJoinSql;Virtual;
    procedure WhereSql;Virtual;
    procedure OrderBySql;Virtual;
    procedure GroupBySql;Virtual;
    procedure SetParameters;Virtual;

    procedure InitVariable;Virtual;
    procedure FormatScreen;Virtual;
    procedure SetVariable;Virtual;
    procedure setImages;Virtual;
    procedure ClearFields;Virtual;


  public
    { Public declarations }
    CodigoRegistro : Integer;
    Page : Integer;
    FEstabelecimento: TControllerInstitution;
    procedure Search;Virtual;
    procedure execute;Virtual;
  end;

var
  BaseReport: TBaseReport;

implementation

{$R *.dfm}

uses MainModule;


{ TBaseReport }

procedure TBaseReport.ClearFields;
Var
  I,J:Integer;
begin
  for I := 0 to ((ComponentCount)-1) do
  begin
    if (Components[I].ClassName = 'TQRMemo') then
    Begin
      TQRMemo(Components[I]).Transparent := False;
      TQRMemo(Components[I]).BringToFront;
      TQRMemo(Components[I]).Font.Size := 8;
      if copy(TQRMemo(Components[I]).Name,1,2) = 'M_' then
      Begin
        TQRMemo(Components[I]).Lines.Clear;
        TQRMemo(Components[I]).Font.Style := [];
      End
      else
      Begin
       TQRMemo(Components[I]).Font.Style := [fsBold];
      End;
    End;
  end;
end;


procedure TBaseReport.execute;
begin
  SetVariable;
  setImages;
  FormatScreen;
  ClearFields;
end;

procedure TBaseReport.FormatScreen;
begin
  //
end;

procedure TBaseReport.FormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TBaseReport.FromSql;
begin
  //
end;


procedure TBaseReport.GroupBySql;
begin

end;

procedure TBaseReport.InitVariable;
begin
  FEstabelecimento := TControllerInstitution.Create(self);
  cbxPrinters.Items.Assign(Printer.Printers);
  cbxPrinters.ItemIndex := 0;
  Qrpt.PrinterSettings.PrinterIndex:=cbxPrinters.ItemIndex;
end;

procedure TBaseReport.InnerJoinSql;
begin

end;

procedure TBaseReport.OrderBySql;
begin

end;

procedure TBaseReport.Search;
begin
  with Qry do
  Begin
    Active := False;
    Connection := getConnection;
    sql.Clear;
    SelectTxt := '';
    InnerJoinTxt := '';
    WhereTxt := '';
    UnionSelectTxt := '';
    UnionInnerJoinTxt := '';
    UnionWhereTxt := '';
    OrderByTxt := '';
    SelectSql;
    FromSql;
    InnerJoinSql;
    WhereSql;
    GroupBySql;
    OrderBySql;
    SQL.Add(SelectTxt);
    SQL.Add(FromTxt);
    SQL.Add(InnerJoinTxt);
    SQL.Add(WhereTxt);
    if Trim(UnionSelectTxt) <> '' then
    Begin
      SQL.Add(' Union ');
      SQL.Add(UnionSelectTxt);
      SQL.Add(UnionFromTxt);
    End;
    if Trim(UnionInnerJoinTxt) <> '' then
      SQL.Add(UnionInnerJoinTxt);
    if Trim(UnionWhereTxt) <> ''     then
      SQL.Add(UnionWhereTxt);
    SQL.Add(GroupByTxt);
    SQL.Add(OrderByTxt);
    SetParameters;
    Prepare;
    Active := True;

    FetchAll;
  End;
end;

procedure TBaseReport.SelectSql;
begin

end;



procedure TBaseReport.setImages;
begin
  //
end;

procedure TBaseReport.SetParameters;
begin

end;

procedure TBaseReport.SetVariable;
begin
  //
end;

procedure TBaseReport.WhereSql;
begin

end;

end.
