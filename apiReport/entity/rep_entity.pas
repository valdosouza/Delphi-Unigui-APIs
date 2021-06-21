unit rep_entity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, base_report_list, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, QRPDFFilt, QRCtrls,
  QuickRpt, Vcl.ExtCtrls, prm_print_entities, Vcl.StdCtrls;

type
  TRepEntity = class(TBaseReportList)
  private

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
    Par : TPrmPrintEntities;
  end;

var
  RepEntity: TRepEntity;

implementation

{$R *.dfm}

{ TRepEntity }

procedure TRepEntity.FromSql;
begin
  FromTxt :=  ' FROM tb_entity en ';

  UnionFromTxt := 'FROM tb_entity en ';
end;

procedure TRepEntity.GroupBySql;
begin
  inherited;

end;

procedure TRepEntity.InnerJoinSql;
begin
  InnerJoinTxt := concat(
                    InnerJoinTxt +
                    '  inner join tb_institution_has_entity i ',
                    '  on (en.id = i.tb_entity_id) ',
                    ' inner join tb_address ad ',
                    ' on (ad.id = en.id) ',
                    ' inner join tb_state st ',
                    ' on (st.id = ad.tb_state_id) ',
                    ' inner join tb_city cy ',
                    ' on (cy.id = ad.tb_city_id) ',
                    ' left outer join tb_phone ph ',
                    ' on (ph.id = en.id) '
                  );
  //union======================================================================
  UnionInnerJoinTxt :=  concat(
                            UnionInnerJoinTxt +
                            '  INNER JOIN tb_company co ',
                            '  ON ( en.id = co.id ) ',
                            '  inner join tb_institution_has_entity i ',
                            '  on (en.id = i.tb_entity_id) ',
                            '  inner join tb_address ad ',
                            '  on (ad.id = en.id) ',
                            '  inner join tb_state st ',
                            '  on (st.id = ad.tb_state_id) ',
                            '  inner join tb_city cy ',
                            '  on (cy.id = ad.tb_city_id) ',
                            '  left outer join tb_phone ph ',
                            '  on (ph.id = en.id) '
                        );
end;

procedure TRepEntity.OrderBySql;
begin
  inherited;

end;

procedure TRepEntity.SelectSql;
begin
  SelectTxt := concat(
                'SELECT en.id, en.name_company, en.nick_trade, ad.neighborhood, ph.number phone '
                );

  UnionSelectTxt := concat(
                      'SELECT en.id, en.name_company, en.nick_trade, ad.neighborhood, ph.number phone '
                    );

end;

procedure TRepEntity.SetParameters;
begin
  with qry do
  Begin
    ParamByName('tb_institution_id').AsInteger := par.Estabelecimento;
    if ( par.Estado <> '') then
      ParamByName('state').AsString := Par.Estado;
    if ( par.Cidade  <> '') then
      ParamByName('city').AsString := par.Cidade
  end;
end;

procedure TRepEntity.WhereSql;
begin
  WhereTxt := 'WHERE (i.tb_institution_id =:tb_institution_id ) ';
  UnionWhereTxt := 'WHERE (i.tb_institution_id =:tb_institution_id ) ';

  if (par.Estado  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( st.id =:state) ';
    UnionWhereTxt := UnionWhereTxt + ' and ( st.id =:state ) ';
  End;

  if (Par.Cidade  <> '') then
  Begin
    WhereTxt := WhereTxt + ' and ( cy.id =:city) ';
    UnionWhereTxt := UnionWhereTxt + ' and ( cy.id  =:city ) ';
  End;

  //Fone
  WhereTxt := WhereTxt + ' and ( ph.kind = ''Fone'') ';
  UnionWhereTxt := UnionWhereTxt + ' and ( ph.kind = ''Fone'') ';

end;

end.
