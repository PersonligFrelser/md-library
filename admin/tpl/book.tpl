<section id="content">
    <ul class="collection with-header">
        <li class="collection-header"><h6 class="center">Books<span id="total-books" class="badge books">0</span></h6></li>
        <li class="collection-item">
            <div class="input-field">
                <i class="material-icons prefix">search</i>
                <input id="search_input" type="text" name="q" class="grey-text icon-prefix" style="padding-left:40px" placeholder="Harry Potter and the Chambers of Secret">
            </div>
            <div class="divider"></div>
            <table class="striped">
                <thead>
                <tr>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Pages</th>
                    <th>Published</th>
                    <th>Manage</th>
                </tr>
                </thead>

                <tbody id="book-list">
                    <!-- Dynamically inserted books -->
                </tbody>

                <!-- Modal Structure -->
                <div id="modal-delete" class="modal">
                    <div class="modal-content">
                        <h4>Delete book</h4>
                        <p>Are you sure you want to delete <i id="modal-delete-book"></i>?</p>
                    </div>
                    <div id="modal-action" class="modal-footer">
                        <!-- Modal action -->
                    </div>
                </div>
            </table>
        </li>
    </ul>
    <article id="asd"></article>
</section>