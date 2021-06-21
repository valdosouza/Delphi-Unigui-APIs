unit rep_product;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_product,  Vcl.StdCtrls;

type
  TRepProduct = class(TBaseReportList)
  private
    { Private declarations }
  protected
    procedure SelectSql;override;
    procedure FromSql;override;
    procedure InnerJoinSql;override;
    procedure WhereSql;override;
    procedure OrderBySql;override;
    procedure GroupBySql;override;
    procedure SetParameters;override;
  public
    { Public declarations }
    LcParam : TPrmPrintProduct;
  end;

var
  RepProduct: TRepProduct;

implementation

{$R *.dfm}

{ TRepProduct }

procedure TRepProduct.FromSql;
begin
  FromTxt := ' from tb_product pr ';
end;

procedure TRepProduct.GroupBySql;
begin


end;

procedure TRepProduct.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                 ' inner join tb_category c ',
                 ' on (c.id = pr.tb_category_id) and ( c.tb_institution_id = pr.tb_institution_id )'
                );
end;

procedure TRepProduct.OrderBySql;
begin
  OrderByTxt := ' order by c.description, pr.description ';
end;

procedure TRepProduct.SelectSql;
begin
  SelectTxt := concat(
                ' select  pr.id, pr.identifier, pr.description product , c.description category '
              );
end;

procedure TRepProduct.SetParameters;
begin
  with Qry do
  Begin
    ParamByName('institution_id').AsInteger := LcParam.Estabelecimento;

    if (LcParam.Categoria > 0 ) then
      ParamByName('category_id').AsInteger := LcParam.Categoria;
  End;
end;

procedure TRepProduct.WhereSql;
begin
  WhereTxt := concat(
                  ' Where pr.tb_institution_id =:institution_id '
              );

  if (LcParam.Categoria > 0 ) then
    WhereTxt := concat(
                  WhereTxt,
                  ' and (c.id =:category_id) '
                );

end;

end.
