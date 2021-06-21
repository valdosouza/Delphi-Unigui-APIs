inherited CadSuInstitutionTemp: TCadSuInstitutionTemp
  Caption = 'Super - Cadastro de Estabelecimentos'
  ExplicitWidth = 661
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pg_Main: TUniPageControl
    ActivePage = Modulos
    object Modulos: TUniTabSheet
      Hint = ''
      Caption = 'Modulos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 645
      ExplicitHeight = 224
      object dbg_AvalibleList: TUniDBGrid
        Left = 3
        Top = 3
        Width = 273
        Height = 190
        Hint = ''
        HeaderTitle = 'Interfaces Disponiveis'
        DataSource = ds_search_available
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'description'
            Title.Caption = 'Interfaces Disponiveis'
            Width = 604
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
      object sb_int_to_mod: TUniSpeedButton
        Left = 282
        Top = 55
        Width = 56
        Height = 22
        Hint = ''
        Caption = '>>'
        ParentColor = False
        Color = clWindow
        OnClick = sb_int_to_modClick
      end
      object sb_mod_to_int: TUniSpeedButton
        Left = 282
        Top = 88
        Width = 56
        Height = 22
        Hint = ''
        Caption = '<<'
        ParentColor = False
        Color = clWindow
        OnClick = sb_mod_to_intClick
      end
      object UniDBGrid1: TUniDBGrid
        Left = 344
        Top = 3
        Width = 273
        Height = 190
        Hint = ''
        HeaderTitle = 'Interfaces Disponiveis'
        DataSource = ds_search_use
        Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        LoadMask.Message = 'Loading data...'
        TabOrder = 3
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = 'id'
            Width = 64
            Visible = False
            CheckBoxField.FieldValues = 'true;false'
          end
          item
            FieldName = 'description'
            Title.Caption = 'Interfaces Disponiveis'
            Width = 604
            CheckBoxField.FieldValues = 'true;false'
          end>
      end
    end
  end
  inherited Menu: TUniMainMenu
    inherited MnuTarefas: TUniMenuItem
      object MnuUsuarios: TUniMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = MnuUsuariosClick
      end
    end
  end
  object cds_available: TClientDataSet
    PersistDataPacket.Data = {
      450000009619E0BD010000001800000002000000000003000000450002696404
      000100000000000B6465736372697074696F6E01004900000001000557494454
      480200020064000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 266
    object cds_availableid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_availabledescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_search_available: TDataSource
    DataSet = cds_available
    Left = 224
    Top = 322
  end
  object cds_used: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    Left = 368
    Top = 266
    object cds_usedid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_useddescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_search_use: TDataSource
    DataSet = cds_used
    Left = 368
    Top = 322
  end
end
