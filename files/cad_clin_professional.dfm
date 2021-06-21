inherited CadClinProfessional: TCadClinProfessional
  Caption = 'Cadastro do Professional'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pg_Main: TUniPageControl
    ActivePage = tbs_PatientList
    inherited tbs_tributacao: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
      object pnl_outrasinfo_row_1: TUniPanel
        Left = 0
        Top = 0
        Width = 692
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 0
        BorderStyle = ubsNone
        Caption = ''
        object Rg_CadastroAtivo: TUniRadioGroup
          Left = 0
          Top = 0
          Width = 118
          Height = 52
          Hint = ''
          Items.Strings = (
            'SIM'
            'N'#195'O')
          Align = alLeft
          Caption = 'Cadastro Ativo'
          TabOrder = 1
          Columns = 2
        end
      end
    end
    object tbs_PatientList: TUniTabSheet
      Hint = ''
      Caption = 'Lista de Pacientes'
      object DBG_Patient: TUniDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 686
        Height = 193
        Hint = ''
        DataSource = ds_patient
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 64
          end
          item
            FieldName = 'name_company'
            Title.Caption = 'Nome'
            Width = 540
          end>
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 199
        Width = 692
        Height = 41
        Hint = ''
        Align = alBottom
        TabOrder = 1
        Caption = ''
        object sb_Insert_Items: TUniSpeedButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 115
          Height = 33
          Hint = ''
          Caption = 'Inserir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 1
          OnClick = sb_Insert_ItemsClick
        end
        object sb_Delete_Items: TUniSpeedButton
          AlignWithMargins = True
          Left = 125
          Top = 4
          Width = 129
          Height = 33
          Hint = ''
          Caption = 'Excluir'
          Align = alLeft
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Name = 'Arial'
          ParentColor = False
          Color = clWindow
          TabOrder = 2
          OnClick = sb_Delete_ItemsClick
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 104
    Top = 112
  end
  inherited ds_msg: TDataSource
    Left = 104
    Top = 168
  end
  object cds_patient: TClientDataSet
    PersistDataPacket.Data = {
      460000009619E0BD010000001800000002000000000003000000460002696404
      000100040000000C6E616D655F636F6D70616E79010049000000010005574944
      54480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 456
    Top = 264
    object cds_patientid: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object cds_patientname_company: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'name_company'
      Origin = 'name_company'
      Size = 100
    end
  end
  object ds_patient: TDataSource
    DataSet = cds_patient
    Left = 456
    Top = 320
  end
end
