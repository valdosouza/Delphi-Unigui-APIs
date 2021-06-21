inherited TasUserHasPrivilege: TTasUserHasPrivilege
  ClientHeight = 451
  ClientWidth = 900
  Caption = 'Privilegios de Usu'#225'rios'
  ExplicitWidth = 916
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  object pnl_fundos: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 900
    Height = 387
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object dbg_modules: TUniDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 273
      Height = 377
      Hint = ''
      HeaderTitle = 'M'#243'dulos Dispon'#237'veis'
      DataSource = ds_modules
      Options = [dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
      WebOptions.Paged = False
      LoadMask.Message = 'Carregando M'#243'dulos'
      Align = alLeft
      TabOrder = 1
      Columns = <
        item
          FieldName = 'description'
          Title.Caption = 'Interfaces Disponiveis'
          Width = 230
        end>
    end
    object dbg_interface: TUniDBGrid
      AlignWithMargins = True
      Left = 284
      Top = 5
      Width = 273
      Height = 377
      Hint = ''
      HeaderTitle = 'Interfaces Dispon'#237'veis'
      DataSource = ds_interfaces
      Options = [dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
      WebOptions.Paged = False
      LoadMask.Message = 'Carregando Interfaces'
      Align = alLeft
      TabOrder = 2
      Columns = <
        item
          FieldName = 'description'
          Title.Caption = 'Interfaces Disponiveis'
          Width = 230
        end>
    end
    object dbg_privilege: TUniDBGrid
      AlignWithMargins = True
      Left = 563
      Top = 5
      Width = 334
      Height = 377
      Hint = ''
      HeaderTitle = 'Privil'#233'gios'
      DataSource = ds_privilege
      Options = [dgEditing, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
      WebOptions.Paged = False
      LoadMask.Message = 'Carregando Privil'#233'gios'
      Align = alLeft
      TabOrder = 3
      Columns = <
        item
          FieldName = 'active'
          Title.Caption = 'active'
          Width = 110
          Alignment = taLeftJustify
          CheckBoxField.AutoPost = True
          CheckBoxField.BooleanFieldOnly = False
          CheckBoxField.FieldValues = 'S;N'
          CheckBoxField.DisplayValues = 'Liberado;Bloqueado'
        end
        item
          FieldName = 'description'
          Title.Caption = 'Interfaces Disponiveis'
          Width = 200
          ReadOnly = True
        end>
    end
  end
  object pnl_buttons: TUniPanel [1]
    Left = 0
    Top = 387
    Width = 900
    Height = 64
    Hint = ''
    BodyRTL = False
    Align = alBottom
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object Sb_Close: TUniSpeedButton
      AlignWithMargins = True
      Left = 192
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Caption = 'Sair'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 1
      OnClick = Sb_CloseClick
    end
    object Sb_Apply: TUniSpeedButton
      AlignWithMargins = True
      Left = 2
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Enabled = False
      Caption = 'Aplicar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 2
      OnClick = Sb_ApplyClick
    end
    object Sb_Cancel: TUniSpeedButton
      AlignWithMargins = True
      Left = 97
      Top = 5
      Width = 95
      Height = 54
      Hint = ''
      Margins.Left = 0
      Margins.Right = 0
      Enabled = False
      Caption = 'Cancelar'
      Align = alLeft
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      ParentColor = False
      Color = clWindow
      IconAlign = iaTop
      TabOrder = 3
      OnClick = Sb_CancelClick
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 8
    Top = 192
  end
  inherited ds_msg: TDataSource
    Left = 8
    Top = 248
  end
  object cds_modules: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    AfterScroll = cds_modulesAfterScroll
    Left = 120
    Top = 82
    object cds_modulesid: TIntegerField
      FieldName = 'id'
      KeyFields = 'id'
    end
    object cds_modulesdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_modules: TDataSource
    DataSet = cds_modules
    Left = 120
    Top = 138
  end
  object cds_interfaces: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    AfterScroll = cds_interfacesAfterScroll
    Left = 336
    Top = 82
    object cds_interfacesid: TIntegerField
      FieldName = 'id'
    end
    object cds_interfacesdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
  object ds_interfaces: TDataSource
    DataSet = cds_interfaces
    Left = 336
    Top = 138
  end
  object cds_privilege: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSP'
    AfterPost = cds_privilegeAfterPost
    Left = 600
    Top = 82
    object cds_privilegeid: TIntegerField
      FieldName = 'id'
    end
    object cds_privilegedescription: TStringField
      FieldName = 'description'
      Size = 100
    end
    object cds_privilegeactive: TStringField
      FieldName = 'active'
      Size = 1
    end
  end
  object ds_privilege: TDataSource
    DataSet = cds_privilege
    Left = 600
    Top = 138
  end
end
