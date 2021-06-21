unit ctrl_mob_salesman;

interface

uses System.Classes, ctrl_mob_base, System.SysUtils,prm_salesman,
  FireDAC.Comp.Client, ctrl_mob_collaborator, tblSalesman,objSalesMan;

Type
  TCtrlMobSalesman = class(TCtrlMobBase)
    private

    public
      Registro : TSalesman;
      MColaborador : TCtrlMobCollaborator;
      Parametro : TPrmSalesMan;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save: boolean;
      procedure assign(ObjOri : TSalesman);
      function saveDataObjeto( DObj: TObjSalesMan ):Boolean;
      procedure Clear;
  end;

implementation

{ TCtrlMobSalesman }

uses MainModule;


procedure TCtrlMobSalesman.assign(ObjOri: TSalesman);
begin
  _assign(ObjOri,Registro);
end;

procedure TCtrlMobSalesman.Clear;
begin
  clearObj(Registro);
end;

constructor TCtrlMobSalesman.Create(AOwner: TComponent);
begin
  Registro      := TSalesman.Create;
  MColaborador  := TCtrlMobCollaborator.Create(Self);
  Parametro     := TPrmSalesMan.Create;
  createTable;
end;

procedure TCtrlMobSalesman.createTable;
begin
  execcmd(concat(
                'CREATE TABLE if not exists tb_salesman ( ',
                '  id int(11) NOT NULL , ',
                '  tb_institution_id int(11) , ',
                '  active char(1) NOT NULL , ',
                '  aliq_kickback decimal(10,2) , ',
                '  kickback_product varchar(1) , ',
                '  flex_value decimal(10,2) , ',
                '  created_at datetime , ',
                '  updated_at datetime , ',
                '  PRIMARY KEY (id,tb_institution_id) ); '
      ));
end;

destructor TCtrlMobSalesman.Destroy;
begin
  {$IFDEF WIN32}
  Registro.DisposeOf;;
  MColaborador.Destroy;;
  Parametro.Destroy;
  {$ENDIF }

end;

function TCtrlMobSalesman.save: boolean;
begin
  try
    SaveObj(Registro);
    Result := True;
  except
    Result := False;
  end;

end;

function TCtrlMobSalesman.saveDataObjeto(DObj: TObjSalesMan): Boolean;
Var
  I : Integer;
begin
  DObj.Estabelecimento := DObj.Vendedor.Estabelecimento;
  DObj.Colaborador.Estabelecimento := DObj.Estabelecimento;
  MColaborador.saveDataObjeto(DObj.Fiscal,DObj.Colaborador);

  //Salvar
  DObj.Vendedor.Codigo := DObj.Fiscal.Entidade.Entidade.Codigo;
  _assign( DObj.Vendedor, Registro );

  Registro.codigo := MColaborador.MFiscal.Registro.Codigo;
  save;
  //Reposiciona os codigo
  DObj.Vendedor.Codigo   := Registro.Codigo;

end;

end.
