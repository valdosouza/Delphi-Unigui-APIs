unit sea_iteration;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniGUIBaseClasses, uniPanel,
  uniBasicGrid, uniDBGrid, base_search, base_frame, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, MainModule, uniButton,
  Datasnap.DBClient, Datasnap.Provider, uniPageControl;

type
  TSeaIteration = class(TBaseSearch)
    Sb_Atualizar: TUniButton;
    cds_searchordem: TIntegerField;
    cds_searchiteracao: TIntegerField;
    cds_searchupdated_at: TDateTimeField;
    cds_searchuser_name: TStringField;
    cds_searchcomentario: TStringField;
    cds_searchsituacao: TStringField;
    procedure Sb_AtualizarClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure search;
  end;

implementation

{$R *.dfm}



{ TSeaInteration }

procedure TSeaIteration.Sb_AtualizarClick(Sender: TObject);
begin
  search;
end;

procedure TSeaIteration.search;
begin
  cds_search.Active := False;
  with umm.Qr_Crud do
  Begin
    Active := False;
    sql.Clear;
    sql.Add(concat(
              'select o.id ordem, i.id iteracao, i.updated_at, u.name_company user_name,',
              ' i.description comentario, s.description situacao ',
              'from tb_iteration i ',

              '  inner join tb_situation s ',
              '  on (i.tb_situation_id = s.id ) ',
              '    and (i.tb_institution_id = s.tb_institution_id ) ',

              '  inner join tb_order o ',
              '  on (o.id = i.tb_order_id) ',
              '    and (o.tb_institution_id = i.tb_institution_id ) ',

              '   inner join tb_entity u ',
              '   on (u.id = o.tb_user_id) ',

              '  left outer join tb_iteration_has_iteration ihi ',
              '  ON (ihi.tb_iteration_id_detail = i.id ) ',
              '    and (ihi.tb_institution_id = i.tb_institution_id ) ',
              '    and (ihi.tb_order_id = i.tb_order_id ) ',
              'where o.tb_institution_id =:tb_institution_id ',
              ' and ( tb_customer_id=:tb_customer_id ) ',
              ' and ( ihi.tb_iteration_id_master is null ) ',
              ' and ( ihi.tb_iteration_id_detail is null ) '));

    sql.Add('order by o.id, i.id ');

    ParamByName('tb_institution_id').AsInteger := UMM.GInstitution.Registro.Codigo;
    ParamByName('tb_customer_id').AsInteger := UMM.Customer;
    Active := True;
    FetchAll;
  End;
  cds_search.Active := True;
  Umm.Qr_Crud.close;
end;

end.
