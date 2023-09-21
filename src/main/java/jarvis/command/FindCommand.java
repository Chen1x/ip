package jarvis.command;


import jarvis.storage.Storage;
import jarvis.task.Task;
import jarvis.tasklist.TaskList;
import jarvis.ui.Ui;

import java.util.ArrayList;

public class FindCommand extends Command {

    private String keyword;

    /**
     * Constructor for FindCommand.
     *
     * @param keyword The keyword to search for.
     */
    public FindCommand(String keyword) {
        this.keyword = keyword;
    }

    /**
     * Executes the FindCommand.
     * Finds all tasks that contain the keyword, and displays them to the user.
     *
     * @param tasks The list of tasks.
     * @param ui The Ui object, for displaying the matching tasks to the user.
     * @param storage The Storage object, not used here.
     */
    @Override
    public void execute(TaskList tasks, Ui ui, Storage storage) {
        ArrayList<Task> matchingTasks = tasks.find(keyword);
        ui.displayMatchingTasks(matchingTasks);
    }
}