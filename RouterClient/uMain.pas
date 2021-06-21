unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ScrollBox, FMX.Memo,
  IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Json, tblEntity, system.JSON, REST.types, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarRestAgency;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
Var
  LcEntity : TEntity;
  LcJSONObject : TJSONObject;
  LcJSONPair : TJSONPair;
  LcJSOnArray : TJSOnArray;
begin
  Self.CarregarRestAgency;
  RESTRequest1.Resource := '/entities';
  RESTRequest1.Method := TRESTRequestMethod.rmGET;
  RESTRequest1.Execute;

  LcJSONObject := RESTResponse1.JSONValue as TJSONObject;

  LcJSONPair := LcJSONObject.Get(0);

  ShowMessage(LcJSONPair.ToString);

  LcJSOnArray := LcJSONPair.JsonValue as TJSONArray;

  LcEntity := TJson.JsonToObject<TEntity>(LcJSOnArray.Get(0).ToJSON);
  memo1.Text := EmptyStr;
  memo1.Lines.Add(LcEntity.Codigo.ToString);
  memo1.Lines.Add(LcEntity.NomeRazao);
  memo1.Lines.Add(LcEntity.ApelidoFantasia);
  memo1.Lines.Add(DateToStr(LcEntity.AniversarioFundacao));
  memo1.Lines.Add(LcEntity.Observacao);

end;

procedure TForm1.Button2Click(Sender: TObject);
Var
  LcEntity : TEntity;
  LcJSONObject : TJSONObject;
begin
  LcEntity := TEntity.create;
  try
    LcEntity.Codigo := 1;
    LcEntity.NomeRazao := 'Florisvaldo';
    LcEntity.ApelidoFantasia := 'Valdo';
    LcEntity.AniversarioFundacao := dATE;
    LcEntity.RamoAtividade := 1;
    LcEntity.Observacao := 'teste de envio';
    LcEntity.RegistroCriado := Date;
    LcEntity.RegistroAlterado := Date;

    LcJSONObject := TJson.ObjectToJsonObject(LcEntity);

    Self.CarregarRestAgency;
    RESTRequest1.Resource := '/entities';
    RESTRequest1.Method := TRESTRequestMethod.rmPOST;
    RESTRequest1.AddBody(LcJSONObject.ToString,ContentTypeFromString('application/json'));
    RESTRequest1.Execute;

  finally
    FreeAndNil(LcEntity);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
Var
  LcEntity : TEntity;
  LcJSONObject : TJSONObject;
begin
  LcEntity := TEntity.create;
  try
    LcEntity.Codigo := 35;
    LcEntity.NomeRazao := 'Florisvaldo';
    LcEntity.ApelidoFantasia := 'Valdo';
    LcEntity.AniversarioFundacao := dATE;
    LcEntity.RamoAtividade := 1;
    LcEntity.Observacao := 'teste de envio';
    LcEntity.RegistroCriado := Date;
    LcEntity.RegistroAlterado := Date;

    LcJSONObject := TJson.ObjectToJsonObject(LcEntity);

    Self.CarregarRestAgency;
    RESTRequest1.Resource := '/entities/{35}';
    RESTRequest1.Method := TRESTRequestMethod.rmPUT;
    RESTRequest1.Params.AddUrlSegment('codigo','35');
    RESTRequest1.Execute;

  finally
    FreeAndNil(LcEntity);
  end;

end;

procedure TForm1.Button4Click(Sender: TObject);
Var
  LcEntity : TEntity;
  LcJSONObject : TJSONObject;
begin
  LcEntity := TEntity.create;
  try
    LcEntity.Codigo := 1;
    LcEntity.NomeRazao := 'Florisvaldo';
    LcEntity.ApelidoFantasia := 'Valdo';
    LcEntity.AniversarioFundacao := dATE;
    LcEntity.RamoAtividade := 1;
    LcEntity.Observacao := 'teste de envio';
    LcEntity.RegistroCriado := Date;
    LcEntity.RegistroAlterado := Date;

    LcJSONObject := TJson.ObjectToJsonObject(LcEntity);

    Self.CarregarRestAgency;
    RESTRequest1.Resource := '/entities/{35}';
    RESTRequest1.Method := TRESTRequestMethod.rmDELETE;
    RESTRequest1.Params.AddUrlSegment('id',LcEntity.Codigo.ToString);
    RESTRequest1.Execute;

  finally
    FreeAndNil(LcEntity);
  end;


end;

procedure TForm1.CarregarRestAgency;
begin
  RestClient1.ResetToDefaults;
  RESTRequest1.ResetToDefaults;
  RESTResponse1.ResetToDefaults;
  RestClient1.BaseURL := 'http://localhost:223/datasnap/rest/TSMAgency';
  memo1.Text := EmptyStr;

end;

end.
