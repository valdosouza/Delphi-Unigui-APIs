unit rep_provider_file;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_entities, rep_entity, UnFunctions,
  Vcl.StdCtrls;

type
  TRepProviderFile = class(TRepEntity)
    Detail: TQRBand;
    E_Codigo: TQRLabel;
    E_name_company: TQRLabel;
    E_Neighborhood: TQRLabel;
    E_Phone: TQRLabel;
    QRBand3: TQRBand;
    LB_Total: TQRLabel;
    tl_Count: TQRExpr;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    procedure DetailBeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
  private
    { Private declarations }
  protected
    procedure InnerJoinSql;override;
  public
    { Public declarations }
  end;

var
  RepProviderFile: TRepProviderFile;

implementation

{$R *.dfm}

{ TRepProviderFile }

procedure TRepProviderFile.DetailBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  with Qry do
  Begin
    E_Codigo.Caption        := FieldByName('id').AsString;
    E_name_company.Caption  := FieldByName('name_company').AsString;
    E_Neighborhood.Caption  := FieldByName('neighborhood').AsString;
    E_Phone.Caption         := MaskFone( FieldByName('phone').AsString );
  End;
end;

procedure TRepProviderFile.InnerJoinSql;
begin
  inherited;
  InnerJoinTxt := concat(
                    InnerJoinTxt +
                    ' inner join tb_provider pvr ',
                    ' on (pvr.id = en.id) '
                  );
  UnionInnerJoinTxt := concat(
                         UnionInnerJoinTxt +
                         ' inner join tb_provider pvr ',
                         ' on (pvr.id = en.id) '
                      );

end;

end.
