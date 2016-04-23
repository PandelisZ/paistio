'use babel';

import FootsizeView from './footsize-view';
import { CompositeDisposable } from 'atom';

export default {

  footsizeView: null,
  modalPanel: null,
  subscriptions: null,

  activate(state) {
    this.footsizeView = new FootsizeView(state.footsizeViewState);
    this.modalPanel = atom.workspace.addModalPanel({
      item: this.footsizeView.getElement(),
      visible: false
    });

    // Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new CompositeDisposable();

    // Register command that toggles this view
    this.subscriptions.add(atom.commands.add('atom-workspace', {
      'footsize:toggle': () => this.toggle()
    }));
  },

  deactivate() {
    this.modalPanel.destroy();
    this.subscriptions.dispose();
    this.footsizeView.destroy();
  },

  serialize() {
    return {
      footsizeViewState: this.footsizeView.serialize()
    };
  },

  toggle() {
    if (this.modalPanel.isVisible()) {
      return this.modalPanel.hide();
    } else {
      editor = atom.workspace.getActiveTextEditor();
      words = editor.getText().split(/\s+/).length;
      this.footsizeView.setCount(words);
      return this.modalPanel.show();
    }

    // console.log('Footsize was toggled!');
    // return (
    //   this.modalPanel.isVisible() ?
    //   this.modalPanel.hide() :
    //   this.modalPanel.show()
    // );
  }

};
