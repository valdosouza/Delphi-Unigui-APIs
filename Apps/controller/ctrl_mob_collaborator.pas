unit ctrl_mob_collaborator;

interface

uses System.Classes, ctrl_mob_base, tblCollaborator,System.SysUtils,
  FireDAC.Comp.Client,ctrl_mob_entity_fiscal,objEntityFiscal;

Type
  TCtrlMobCollaborator = class(TCtrlMobBase)
    private

    public
      Registro : TCollaborator;
      MFiscal : TCtrlMobEntityFiscal;

      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure createTable;
      function save:boolean;
      function saveDataObjeto( DObj: TObjEntityFiscal; Colab:TCollaborator ):Boolean;
  end;

implementation

{ TCtrlMobCollaborator }

uses MainModule;


constructor TCtrlMobCollaborator.Create(AOwner: TComponent);
begin
  Registro := TCollaborator.Create;
  MFiscal := TCtrlMobEntityFiscal.Create(self);
  createTable;
end;

procedure TCtrlMobCollaborator.createTable;
begin
  execcmd(concat(
            'CREATE TABLE if not exists tb_collaborator ( ',
            '  id int(11) NOT NULL, ',
            '  tb_institution_id int(11) NOT NULL, ',
            '  dt_admission date DEFAULT NULL, ',
            '  dt_resignation date DEFAULT NULL, ',
            '  salary decimal(10,2) DEFAULT NULL, ',
            '  pis varchar(11) DEFAULT NULL, ',
            '  fahters_name varchar(100) DEFAULT NULL, ',
            '  mothers_name varchar(100) DEFAULT NULL, ',
            '  vote_number varchar(20) DEFAULT NULL, ',
            '  vote_zone varchar(3) DEFAULT NULL, ',
            '  vote_section varchar(3) DEFAULT NULL, ',
            '  military_certificate varchar(15) DEFAULT NULL, ',
            '  active char(1) DEFAULT NULL, ',
            '  created_at datetime DEFAULT NULL, ',
            '  updated_at datetime DEFAULT NULL, ',
            '  PRIMARY KEY (id,tb_institution_id)) '
      ));
end;

destructor TCtrlMobCollaborator.Destroy;
begin
  {$IFDEF WIN32}
  Registro.disposeOf;
  MFiscal.Destroy;
  {$ENDIF }
end;

function TCtrlMobCollaborator.save: boolean;
begin
  try
    SaveObj(Registro);
    result := True;
  except
    result := False;
  end;
end;

function TCtrlMobCollaborator.saveDataObjeto(DObj: TObjEntityFiscal; Colab:TCollaborator): Boolean;
begin
  MFiscal.saveDataObjeto(DObj);
  //Salvar
  Colab.Codigo := DObj.Entidade.Entidade.Codigo;
  _assign( Colab, Registro );

  Registro.codigo := MFiscal.Registro.Codigo;
  SaveObj(Registro);
  //Reposiciona os codigo de cliente e vendedor

end;

end.
