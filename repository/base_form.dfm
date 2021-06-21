object BaseForm: TBaseForm
  Left = 0
  Top = 0
  ClientHeight = 298
  ClientWidth = 578
  Caption = 'Form B'#225'sico'
  OnShow = UniFormShow
  OldCreateOrder = False
  OnKeyDown = UniFormKeyDown
  BorderIcons = [biSystemMenu, biMaximize]
  Script.Strings = (
    '<script type="text/javascript">'
    '    $('#39'input'#39').keypress(function(e){'
    '        if(e.which==13){ '
    
      '            $("[tabindex='#39'"+($(this).attr("tabindex")+1)+"'#39']").f' +
      'ocus();'
    '            e.preventDefault();'
    '        }'
    '    });    '
    '</script>')
  Visible = True
  KeyPreview = True
  Menu = MenuTask
  NavigateKeys.Enabled = True
  NavigateKeys.Next.Key = 13
  NavigateKeys.KeyCancel.Key = 27
  NavigateKeys.SelectText = True
  MonitoredKeys.Keys = <>
  Layout = 'auto'
  LayoutAttribs.Align = 'top'
  OnCancel = UniFormCancel
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cds_msg: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 48
    object cds_msgid: TStringField
      FieldName = 'id'
      Size = 50
    end
    object cds_msgmensagem: TStringField
      FieldName = 'mensagem'
      Size = 255
    end
  end
  object ds_msg: TDataSource
    DataSet = cds_msg
    Left = 136
    Top = 104
  end
  object MenuTask: TUniMainMenu
    Left = 32
    Top = 8
    object MnuTarefas: TUniMenuItem
      Caption = 'Tarefas'
    end
  end
end
