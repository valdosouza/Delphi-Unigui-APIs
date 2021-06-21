unit ControllerMailing;


interface
uses System.Classes, System.SysUtils,BaseController,
      tblMailing,FireDAC.Comp.Client,FireDAC.Stan.Param,
      ControllerMailingGroup, ControllerEntityHasMailing,
      System.Generics.Collections;

Type
  TListaMailing = TObjectList<TMailing>;
  TControllerMailing = Class(TBaseController)

    procedure clear;
  private
    function getNext:Integer;
  public
    Registro : TMailing;
    Grupo : TControllerMailingGroup;
    EntityHas : TControllerEntityHasMailing;
    Lista : TListaMailing;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function save:boolean;
    function deleteHasEntity(entity,group:Integer):Boolean;
    function doubleCheck(kind:String):boolean;
    procedure getbyKind(tbEntityId:Integer;Kind:String);
    procedure getbyEmail(email:String);
    Function getEntityIdbyEmailGroup(email,grupo:String):Integer;
    function insert:boolean;
    function Valida():boolean;
    function delete: boolean;
    procedure getList(grp:String);overload;
    procedure getList;overload;
  End;

implementation

{ ControllerMailing }

uses
  UnFunctions,ControllerMailingSeq;


procedure TControllerMailing.clear;
begin
  clearObj(Registro);
end;

constructor TControllerMailing.Create(AOwner: TComponent);
begin
  inherited;
  Registro := TMailing.Create;
  Grupo := TControllerMailingGroup.Create(Self);
  EntityHas := TControllerEntityHasMailing.Create(Self);
  Lista := TListaMailing.Create;
end;


function TControllerMailing.delete: boolean;
begin
  Try
    deleteObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMailing.deleteHasEntity(entity,group:Integer): Boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(Concat(
              'delete from tb_entity_has_mailing ',
              'where (tb_entity_id =:entity) ',
              '  and (tb_mailing_group_id =:group) '
      ));
      ParamByName('entity').AsInteger := entity;
      ParamByName('group').AsInteger   := group;
      ExecSQL;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

destructor TControllerMailing.Destroy;
begin
  EntityHas.DisposeOf;
  Grupo.DisposeOf;
  Registro.DisposeOf;
  Lista.DisposeOf;
  inherited;
end;

function TControllerMailing.doubleCheck(kind:String): boolean;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(Concat(
           'SELECT 1 ',
           'FROM tb_mailing ma ',
           '	inner join tb_entity_has_mailing ehm ',
           '  on (ehm.tb_mailing_id = ma.id) ',
           '  inner join tb_mailing_group mg on (mg.id = ehm.tb_mailing_group_id )',
           'where ( ma.email=:email ) ',
           '  and ( ma.id <> :id )',
           '  and (mg.description =:grupo)'
      ));
      ParamByName('email').AsString := Registro.Email;
      ParamByName('id').AsInteger := Registro.Codigo;
      ParamByName('grupo').AsString := kind;
      active := True;
      FetchAll;
      Result := (RecordCount > 0);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

function TControllerMailing.insert: boolean;
begin
  Try
    SaveObj(Registro);
    Result := True;
  Except
    Result := False;
  End;
end;

function TControllerMailing.save: boolean;
Var
  Lc_Email : String;
begin
  Try
    //Guarda o email em variavel local
    Lc_Email := Registro.Email;
    //Verifica se existe
    getbyEmail(Registro.Email);
    //preenche o objeto com o email alterado
    Registro.Email := Lc_Email;
    if Registro.Codigo > 0 then
      updateObj(Registro)
    else
    Begin
      Registro.Codigo := getNext;
      insertObj(Registro);
    End;
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TControllerMailing.getbyEmail(email: String);
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(Concat(
             'SELECT ma.* ',
             'from tb_mailing ma ',
             'where ma.email =:email '
      ));
      ParamByName('email').asString := email;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if exist then
        get(Lc_Qry,Registro);
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;
end;

procedure TControllerMailing.getbyKind(tbEntityId:Integer;Kind:String);
Var
  Lc_Qry : TFDQuery;
begin
  Try
    TRy
      Grupo.Registro.Descricao := kind;
      Grupo.getByDescription;
      Lc_Qry := createQuery;
      with Lc_Qry do
      Begin
        Active := False;
        SQL.Clear;
        SQL.Add(
          Concat('SELECT ma.*                                                               ',
                 'from tb_mailing ma                                                        ',
                 '  inner join tb_entity_has_mailing ehm on (ehm.tb_mailing_id = ma.id)     ',
                 '  left outer join tb_mailing_group mg on (mg.id = ehm.tb_mailing_group_id)     ',
                 'where ehm.tb_mailing_group_id =:group and ehm.tb_entity_id =:entity       ')
                );
        ParamByName('group').Value := Grupo.Registro.Codigo;
        ParamByName('entity').Value := tbEntityId;
        active := True;
        FetchAll;
        exist := (RecordCount > 0);
        if exist then
          get(Lc_Qry, Registro);
      End;
    except
      on E : Exception do
        geralog('ControllerMailing - getbyKind - ',E.Message);
    end;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;



function TControllerMailing.getEntityIdbyEmailGroup(email,grupo: String): Integer;
Var
  Lc_Qry : TFDQuery;
begin
  Try
    Lc_Qry := createQuery;
    with Lc_Qry do
    Begin
      Active := False;
      SQL.Clear;
      SQL.Add(concat(
                'select ehm.tb_entity_id, mg.description ',
                'from tb_mailing ma ',
                '  inner join tb_entity_has_mailing ehm ',
                '  on (ehm.tb_mailing_id = ma.id) ',
                '  inner join tb_mailing_group mg ',
                '  on (mg.id = ehm.tb_mailing_group_id) ',
                'where (ma.email  =:email) ',
                ' and (mg.description =:grupo) '
      ));
      ParamByName('email').asString := email;
      ParamByName('grupo').asString := grupo;
      active := True;
      FetchAll;
      exist := (RecordCount > 0);
      if exist then
        REsult := FieldByName('tb_entity_id').AsInteger
      else
        Result := 0;
    End;
  Finally
    finalizaQuery(Lc_Qry);
  End;

end;

procedure TControllerMailing.getList;
var
  Lc_Qry : TFDQuery;
  ITem : TMailing;
begin
  try
    Lc_Qry := createQuery;
    Lc_Qry.sql.add(
      concat('SELECT m.* ',
             'FROM tb_mailing m ',
             'order by id '
            ));
    Lc_Qry.Active := True;
    Lc_Qry.FetchAll;
    Lc_Qry.First;
    Lista.Clear;
    while not Lc_Qry.eof do
    Begin
      ITem := TMailing.Create;
      get(Lc_Qry,ITem);
      Lista.add(ITem);
      Lc_Qry.next;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;

function TControllerMailing.getNext: Integer;
Var
  LcSeq:TControllerMailingSeq;
begin
  Try
    LcSeq := TControllerMailingSeq.create(nil);
    if( LcSeq.getfree ) then
      result := LcSeq.Registro.Codigo
    else
      result := getNextByField(Registro,'id',0);
  Finally
    LcSeq.DisposeOf;
  End;
end;

procedure TControllerMailing.getList(grp:String);
var
  Lc_Qry : TFDQuery;
  LITem : TMailing;
begin
  Lc_Qry := createQuery;
  try
    Lc_Qry.sql.add(
      concat('SELECT m.* ',
             'FROM tb_mailing m ',
             '  inner join tb_entity_has_mailing ehm ',
             '  on (ehm.tb_mailing_id = m.id) ',
             '  inner join tb_mailing_group mg ',
             '  on (mg.id = ehm.tb_mailing_group_id) ',
             '  inner join tb_entity en ',
             '  on (en.id = ehm.tb_entity_id) ',
             'where (mg.description =:grupo ) and en.id =:entity_id '
            ));
    Lc_Qry.ParamByName('entity_id').AsInteger := Registro.Codigo;
    Lc_Qry.ParamByName('grupo').AsString := grp;
    Lc_Qry.Active := True;
    Lc_Qry.FetchAll;
    Lc_Qry.First;
    Lista.Clear;
    while not Lc_Qry.eof do Begin
      LITem := TMailing.Create;
      with LITem do
      Begin
        Codigo := Lc_Qry.FieldByName('id').asInteger;
        Email := Lc_Qry.FieldByName('email').asString;
        RegistroCriado:= Lc_Qry.FieldByName('created_at').AsDateTime;
        RegistroAlterado:= Lc_Qry.FieldByName('updated_at').AsDateTime;
      end;
      Lista.add(LITem);
      Lc_Qry.next;
    end;
  finally
    FinalizaQuery(Lc_Qry);
  end;
end;


function TControllerMailing.Valida():boolean;
begin
  Result := (Pos('@',Registro.email) >= 2) and
            (Pos('.',Registro.email) >= 0) and
            (Pos('.',Registro.email) < Length(Registro.email));

end;


end.
