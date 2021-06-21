unit un_frx_base_report;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass,  frxDBSet,
  frxExportCSV, frxExportPDF, Data.DB, IBX.IBCustomDataSet,
  IBX.IBQuery,  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ControllerInstitution,  UnFunctions;

type
  TFrxBaseReport = class(TForm)
    frxBase: TfrxReport;
    frxDBaseReport: TfrxDBDataset;
    Qry: TFDQuery;
    frxPDF: TfrxPDFExport;
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  protected
    //Operações com Sql
    SelectTxt : String;
    FromTxt : String;
    InnerJoinTxt : String;
    WhereTxt : String;
    GroupByTxt : String;

    UnionSelectTxt : String;
    UnionFromTxt : String;
    UnionInnerJoinTxt : String;
    UnionWhereTxt : String;
    UnionGroupByTxt : String;

    Union2SelectTxt : String;
    Union2FromTxt : String;
    Union2InnerJoinTxt : String;
    Union2WhereTxt : String;
    Union2GroupByTxt : String;

    OrderByTxt : String;


    procedure InitVariable;Virtual;
    procedure SetVariable;Virtual;
    procedure setImages;Virtual;
    procedure ClearFields;Virtual;
    //Operações com Sql


    procedure SelectSql;Virtual;
    procedure FromSql;Virtual;
    procedure InnerJoinSql;Virtual;
    procedure WhereSql;Virtual;
    procedure OrderBySql;Virtual;
    procedure GroupBySql;Virtual;
    procedure SetParameters;Virtual;


  public
    Page : Integer;
    Titulo : String;
    FEstabelecimento: TControllerInstitution;
    procedure Search;Virtual;
    procedure execute;Virtual;
  end;

var
  FrxBaseReport: TFrxBaseReport;

implementation


{$R *.dfm}

uses MainModule;


{ TFrxBaseReport }


procedure TFrxBaseReport.ClearFields;
begin

end;

procedure TFrxBaseReport.execute;
begin
  SetVariable;
  setImages;
  ClearFields;
  Search;
end;

procedure TFrxBaseReport.FormCreate(Sender: TObject);
begin
  InitVariable;
end;

procedure TFrxBaseReport.FromSql;
begin

end;

procedure TFrxBaseReport.GroupBySql;
begin
  GroupByTxt        := '';
  UnionGroupByTxt   := '';
  Union2GroupByTxt  := '';
end;

procedure TFrxBaseReport.InitVariable;
begin
  FEstabelecimento := TControllerInstitution.Create(Self);
end;

procedure TFrxBaseReport.InnerJoinSql;
begin

end;

procedure TFrxBaseReport.OrderBySql;
begin

end;

procedure TFrxBaseReport.Search;
begin
  with Qry do
  Begin
    Active := False;
    Connection := getConnection;
    sql.Clear;

    SelectTxt           := '';
    FromTxt             := '';
    InnerJoinTxt        := '';
    WhereTxt            := '';
    GroupByTxt          := '';

    UnionSelectTxt      := '';
    UnionFromTxt        := '';
    UnionInnerJoinTxt   := '';
    UnionWhereTxt       := '';
    UnionGroupByTxt     := '';

    Union2SelectTxt     := '';
    Union2FromTxt       := '';
    Union2InnerJoinTxt  := '';
    Union2WhereTxt      := '';
    Union2GroupByTxt    := '';

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
    SQL.Add(GroupByTxt);

    if Trim(UnionSelectTxt) <> '' then
    Begin
      SQL.Add(' Union ');
      SQL.Add(UnionSelectTxt);
      SQL.Add(UnionFromTxt);
      SQL.Add(UnionInnerJoinTxt);
      SQL.Add(UnionWhereTxt);
      SQL.Add(UnionGroupByTxt);
    End;

    if Trim(Union2SelectTxt) <> '' then
    Begin
      SQL.Add(' Union ');
      SQL.Add(Union2SelectTxt);
      SQL.Add(Union2FromTxt);
      SQL.Add(Union2InnerJoinTxt);
      SQL.Add(Union2WhereTxt);
      SQL.Add(Union2GroupByTxt);
    End;

    SQL.Add(OrderByTxt);
    SetParameters;
    Prepare;
    Active := True;
    FetchAll;
  End;
end;

procedure TFrxBaseReport.SelectSql;
begin

end;

procedure TFrxBaseReport.setImages;
begin

end;

procedure TFrxBaseReport.SetParameters;
begin

end;

procedure TFrxBaseReport.SetVariable;
begin
  inherited;
end;

procedure TFrxBaseReport.WhereSql;
begin

end;

end.
